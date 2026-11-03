--[[
    Pigeon Lean Out: client.

    A passenger who presses the key (or uses /leanout) leaves their seat and is attached to the vehicle
    at their window, with their upper body outside. They aim and shoot as they would on foot, and their
    character turns with the camera, so they can cover all the way round. Pressing the key again puts
    them back in their seat. Attachments and aiming are networked by the game, so everyone sees it.

    Nothing runs while the player isn't leaning out, apart from the key binding.
]]

local RESOURCE = GetCurrentResourceName()
local SPEED_FACTOR = { mph = 2.236936, kmh = 3.6 }   -- from metres per second
local FIRST_PERSON = 4                               -- the first-person camera view mode
local TURN_STEP = 1.5                                -- degrees the camera turns before the character follows
local TUNE_STEP = 0.02                               -- metres per press in the tuner

-- Kept off while leaning out: moving, jumping, ducking, cover, melee and getting in or out. Aiming,
-- shooting, reloading and the weapon wheel stay on.
local BLOCKED_CONTROLS = { 21, 22, 23, 30, 31, 36, 44, 75, 140, 141, 142, 143, 263, 264 }
local SHOOT_CONTROLS = { 24, 25, 257 }                -- attack, aim, attack 2
local TUNE_CONTROLS = { up = 172, down = 173, left = 174, right = 175, raise = 10, lower = 11, save = 191, reset = 194 }

local strings = Locales[Config.Locale] or Locales.en
local prepared = LeanOut.prepare(Config, joaat)
local unitFactor = SPEED_FACTOR[Config.SpeedUnit] or SPEED_FACTOR.mph

local out            -- while leaning out: { vehicle, seat, side, seatOffset, halfWidth, offset, tune, yaw, ragdoll }
local tuning = false
local savedView      -- { context, mode } while first person is forced

local function t(key, values)
    local text = strings[key] or Locales.en[key] or key
    return (text:gsub('{(%w+)}', function(name)
        local value = values and values[name]
        return value ~= nil and tostring(value) or '{' .. name .. '}'
    end))
end

local lastShown = {}         -- [message key] = when it was last shown, so a repeated reason shows once
local MESSAGE_COOLDOWN_MS = 4000

local function notify(key, values)
    if not Config.ShowMessages then return end
    local now = GetGameTimer()
    if lastShown[key] and now - lastShown[key] < MESSAGE_COOLDOWN_MS then return end
    lastShown[key] = now
    local text = t(key, values)
    local mode = Config.Notifications
    if mode == 'ox_lib' or (mode == 'auto' and GetResourceState('ox_lib') == 'started') then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'inform' })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

local function allowed()
    local answer = LocalPlayer.state.pigeonLeanOutAllowed
    if answer == nil then return Config.Allowed == nil or Config.Allowed.everyone ~= false end
    return answer == true
end

--- The seat index the player is in (-1 driver, 0 front passenger, 1 and up rear). Empty seats are skipped
--- with IsVehicleSeatFree, because asking who's in an empty seat of a parked car can make GTA put a random
--- ped in it.
local function seatIndexOf(vehicle, ped)
    if GetPedInVehicleSeat(vehicle, -1) == ped then return -1 end
    for seat = 0, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) - 2 do
        if not IsVehicleSeatFree(vehicle, seat) and GetPedInVehicleSeat(vehicle, seat) == ped then return seat end
    end
    return nil
end

local function seatKind(index)
    if index == -1 then return 'driver' end
    if index == 0 then return 'front' end
    return 'rear'
end

local function restoreView()
    if savedView then
        SetCamViewModeForContext(savedView.context, savedView.mode)
        savedView = nil
    end
end

local function forceFirstPerson()
    local context = GetCamActiveViewModeContext()
    if not savedView then savedView = { context = context, mode = GetCamViewModeForContext(context) } end
    if GetCamViewModeForContext(context) ~= FIRST_PERSON then SetCamViewModeForContext(context, FIRST_PERSON) end
end

local function currentOffset()
    return {
        outward = out.offset.outward + out.tune.outward,
        forward = out.offset.forward + out.tune.forward,
        height = out.offset.height + out.tune.height,
    }
end

local function attach(ped)
    local x, y, z = LeanOut.attachPoint(out.seatOffset, out.halfWidth, currentOffset())
    AttachEntityToEntity(ped, out.vehicle, 0, x, y, z, 0.0, 0.0, out.yaw, false, false, false, true, 2, true)
end

--- Puts the player back in the vehicle: their own seat if it's still free, otherwise any free passenger
--- seat, otherwise the driver's seat if nobody's in it. Returns false if every seat is taken.
local function seatBack(ped, vehicle, seat)
    if IsVehicleSeatFree(vehicle, seat) then
        SetPedIntoVehicle(ped, vehicle, seat)
        return true
    end
    for other = 0, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) - 2 do
        if IsVehicleSeatFree(vehicle, other) then
            SetPedIntoVehicle(ped, vehicle, other)
            return true
        end
    end
    if IsVehicleSeatFree(vehicle, -1) then
        SetPedIntoVehicle(ped, vehicle, -1)
        return true
    end
    return false
end

--[[
    Brings the player back in. With `force`, they're let go even if no seat is free (the vehicle's gone,
    they died, or the resource is stopping); without it, they stay out until a seat is free.
]]
local function comeIn(force)
    if not out then return end
    local ped = PlayerPedId()
    local vehicle = out.vehicle
    local usable = DoesEntityExist(vehicle) and not IsEntityDead(vehicle) and not IsPedDeadOrDying(ped, true)

    if usable and not force then
        local seats = 0
        for seat = -1, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) - 2 do
            if IsVehicleSeatFree(vehicle, seat) then seats = seats + 1 end
        end
        if seats == 0 then
            notify('no_seat')
            return
        end
    end

    DetachEntity(ped, true, false)
    if usable then seatBack(ped, vehicle, out.seat) end
    SetPedCanRagdoll(ped, out.ragdoll)
    restoreView()
    out, tuning = nil, false
end

local function leanOut()
    if out then return end
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then return end
    local vehicle = GetVehiclePedIsIn(ped, false)
    local seat = seatIndexOf(vehicle, ped)
    if seat == nil then return end

    local model = GetEntityModel(vehicle)
    local reason = LeanOut.canLeanOut(prepared, {
        allowed = allowed(),
        seat = seatKind(seat),
        speed = GetEntitySpeed(vehicle) * unitFactor,
        model = model,
        class = GetVehicleClass(vehicle),
    })
    if reason then
        notify('cant_' .. reason, { limit = prepared.maxSpeed, unit = Config.SpeedUnit == 'kmh' and 'km/h' or 'mph' })
        return
    end

    local position = GetEntityCoords(ped)
    local seatOffset = GetOffsetFromEntityGivenWorldCoords(vehicle, position.x, position.y, position.z)
    local minimum, maximum = GetModelDimensions(model)
    local halfWidth = math.max(math.abs(minimum.x), math.abs(maximum.x))
    local offset = LeanOut.offsetFor(prepared, model, GetVehicleClass(vehicle))
    local _, _, _, side = LeanOut.attachPoint(seatOffset, halfWidth, offset)

    if Config.RollDownWindow then RollDownWindow(vehicle, LeanOut.windowFor(seat, side)) end

    out = {
        vehicle = vehicle, seat = seat, side = side, seatOffset = seatOffset, halfWidth = halfWidth,
        offset = offset, tune = { outward = 0.0, forward = 0.0, height = 0.0 }, yaw = -90.0 * side,
        ragdoll = CanPedRagdoll(ped),
    }
    SetPedCanRagdoll(ped, false)
    ClearPedTasksImmediately(ped)   -- out of the seat, where they are
    attach(ped)
end

---------------------------------------------------------------------------
-- While leaning out

local function showTuner()
    local o = currentOffset()
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(t('tune_help', {
        outward = ('%.2f'):format(o.outward), forward = ('%.2f'):format(o.forward), height = ('%.2f'):format(o.height),
    }))
    EndTextCommandDisplayHelp(0, false, false, -1)
end

local function tune(ped)
    for _, control in pairs(TUNE_CONTROLS) do DisableControlAction(0, control, true) end
    local moved = true
    if IsDisabledControlJustPressed(0, TUNE_CONTROLS.up) then out.tune.forward = out.tune.forward + TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.down) then out.tune.forward = out.tune.forward - TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.right) then out.tune.outward = out.tune.outward + TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.left) then out.tune.outward = out.tune.outward - TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.raise) then out.tune.height = out.tune.height + TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.lower) then out.tune.height = out.tune.height - TUNE_STEP
    elseif IsDisabledControlJustPressed(0, TUNE_CONTROLS.reset) then out.tune = { outward = 0.0, forward = 0.0, height = 0.0 }
    else moved = false end
    if moved then attach(ped) end

    if IsDisabledControlJustPressed(0, TUNE_CONTROLS.save) then
        local o = currentOffset()
        local name = GetDisplayNameFromVehicleModel(GetEntityModel(out.vehicle)):lower()
        print(('[Pigeon Lean Out] %s'):format(t('tune_saved')))
        print(("    ['%s'] = { outward = %.2f, forward = %.2f, height = %.2f },"):format(name, o.outward, o.forward, o.height))
        notify('tune_printed')
    end
    showTuner()
end

local function whileOut()
    local ped = PlayerPedId()
    local vehicle = out.vehicle

    if not DoesEntityExist(vehicle) or IsEntityDead(vehicle) then
        comeIn(true)
        notify('vehicle_gone')
        return
    end
    if IsPedDeadOrDying(ped, true) or not IsEntityAttachedToEntity(ped, vehicle) then
        comeIn(true)
        return
    end
    if Config.PullInAboveSpeed and Config.PullInAboveSpeed > 0 and GetEntitySpeed(vehicle) * unitFactor > Config.PullInAboveSpeed then
        notify('pulled_in')
        comeIn(false)
        if not out then return end
    end

    -- Turn with the camera.
    local yaw = LeanOut.facing(prepared, GetGameplayCamRot(2).z, GetEntityHeading(vehicle), out.side)
    if math.abs(LeanOut.wrap(yaw - out.yaw)) > TURN_STEP then
        out.yaw = yaw
        attach(ped)
    end

    for _, control in ipairs(BLOCKED_CONTROLS) do DisableControlAction(0, control, true) end

    local weapon = GetSelectedPedWeapon(ped)
    if not LeanOut.weaponAllowed(prepared, weapon, GetWeapontypeGroup(weapon)) then
        for _, control in ipairs(SHOOT_CONTROLS) do DisableControlAction(0, control, true) end
        if IsDisabledControlJustPressed(0, 25) then notify('weapon') end
    end

    if Config.FirstPerson then forceFirstPerson() end
    if tuning then tune(ped) end
end

CreateThread(function()
    while true do
        if out then
            whileOut()
            Wait(0)
        else
            Wait(250)
        end
    end
end)

---------------------------------------------------------------------------
-- Key, command and tuner

RegisterCommand(Config.Command, function()
    if out then comeIn(false) else leanOut() end
end, false)
RegisterKeyMapping(Config.Command, strings.key_description, 'keyboard', Config.Key)

-- The server checks the ACE permission for /leanouttune and tells this game to show the tuner.
RegisterNetEvent('pigeon-lean-out:tune', function()
    if not out then
        notify('tune_lean_first')
        return
    end
    tuning = not tuning
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == RESOURCE then comeIn(true) end
end)
