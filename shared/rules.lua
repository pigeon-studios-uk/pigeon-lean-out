--[[
    Pigeon Lean Out: the rules and the maths.

    Who can lean out, where their character goes on the vehicle, and which way it faces. Nothing here
    calls a native, so it can be tested outside the game: client/main.lua gathers the facts and asks.
]]

LeanOut = {}

local GROUP_PREFIX = 'GROUP_'

--- Turns the config's names into hash sets once. `hash` is joaat in the game, and a stand-in in tests.
function LeanOut.prepare(config, hash)
    local prepared = {
        weapons = {}, groups = {}, blockClasses = {}, blockModels = {}, allowModels = {}, offsets = {},
    }

    local weapons = config.Weapons or {}
    prepared.weaponMode = weapons.mode or 'all'
    for _, name in ipairs(weapons.list or {}) do
        name = tostring(name):upper()
        if name:sub(1, #GROUP_PREFIX) == GROUP_PREFIX then
            prepared.groups[hash(name)] = true
        else
            prepared.weapons[hash(name)] = true
        end
    end

    local vehicles = config.Vehicles or {}
    for _, class in ipairs(vehicles.blockClasses or {}) do prepared.blockClasses[tonumber(class)] = true end
    for _, model in ipairs(vehicles.blockModels or {}) do prepared.blockModels[hash(model)] = true end
    for _, model in ipairs(vehicles.allowModels or {}) do prepared.allowModels[hash(model)] = true end

    local offsets = config.Offsets or {}
    prepared.defaultOffset = offsets.default or { outward = -0.2, forward = 0.0, height = 0.35 }
    prepared.classOffsets = offsets.classes or {}
    for model, offset in pairs(offsets.models or {}) do prepared.offsets[hash(model)] = offset end

    prepared.seats = config.Seats or { front = true, rear = true }
    prepared.maxSpeed = tonumber(config.MaxSpeed) or 0
    prepared.aimArc = math.max(0, math.min(360, tonumber(config.AimArc) or 360))
    return prepared
end

--- True if this weapon may be used while leaning out, by its hash and its group's hash.
function LeanOut.weaponAllowed(prepared, weapon, group)
    local listed = prepared.weapons[weapon] or (group and prepared.groups[group]) or false
    if prepared.weaponMode == 'allow' then return listed end
    if prepared.weaponMode == 'block' then return not listed end
    return true
end

--[[
    Returns nil if the player may lean out now, or the reason they may not:
        'not_allowed' · 'driver' · 'seat' · 'vehicle' · 'speed'
    facts: seat ('driver' | 'front' | 'rear'), speed (in the config's unit), model, class, allowed (the
    server's answer to Config.Allowed).
]]
function LeanOut.canLeanOut(prepared, facts)
    if not facts.allowed then return 'not_allowed' end
    if facts.seat == 'driver' then return 'driver' end
    if not prepared.seats[facts.seat] then return 'seat' end
    if not prepared.allowModels[facts.model] then
        if prepared.blockModels[facts.model] or prepared.blockClasses[facts.class] then return 'vehicle' end
    end
    if prepared.maxSpeed > 0 and facts.speed > prepared.maxSpeed then return 'speed' end
    return nil
end

--- The offset settings for a vehicle: its model's, else its class's, else the default. Missing values
--- come from the default.
function LeanOut.offsetFor(prepared, model, class)
    local chosen = prepared.offsets[model] or prepared.classOffsets[class] or {}
    local default = prepared.defaultOffset
    return {
        outward = tonumber(chosen.outward) or tonumber(default.outward) or 0,
        forward = tonumber(chosen.forward) or tonumber(default.forward) or 0,
        height = tonumber(chosen.height) or tonumber(default.height) or 0,
    }
end

--[[
    Where the character is attached, relative to the vehicle's centre.
        seatOffset: where the character sat, relative to the vehicle (x right, y forward, z up)
        halfWidth:  half the vehicle's width, from its model dimensions
        offset:     LeanOut.offsetFor's result
    Returns x, y, z and the side (1 right, -1 left). `outward` is measured from the vehicle's side:
    negative is inside the body, so the character's waist is in the window.
]]
function LeanOut.attachPoint(seatOffset, halfWidth, offset)
    local side = seatOffset.x < 0 and -1 or 1
    local x = side * (halfWidth + offset.outward)
    return x, seatOffset.y + offset.forward, seatOffset.z + offset.height, side
end

--- Wraps an angle to -180..180.
function LeanOut.wrap(angle)
    angle = (angle + 180) % 360
    if angle < 0 then angle = angle + 360 end
    return angle - 180
end

--[[
    Which way the character faces, relative to the vehicle, so it follows the camera.
        cameraHeading, vehicleHeading: world headings in degrees
        side: 1 right, -1 left
    Facing straight out of a right-hand window is -90 (GTA headings turn anticlockwise), and -90 * side
    in general. With an AimArc under 360, the result stays within half the arc either side of that.
]]
function LeanOut.facing(prepared, cameraHeading, vehicleHeading, side)
    local relative = LeanOut.wrap(cameraHeading - vehicleHeading)
    if prepared.aimArc >= 360 then return relative end
    local out = -90 * side
    local away = LeanOut.wrap(relative - out)
    local half = prepared.aimArc / 2
    if away > half then away = half elseif away < -half then away = -half end
    return LeanOut.wrap(out + away)
end

--- The window beside a seat index (-1 driver, 0 front passenger, 1 and up rear), on this side.
function LeanOut.windowFor(seatIndex, side)
    if seatIndex == -1 then return 0 end
    if seatIndex == 0 then return 1 end
    if seatIndex == 1 or seatIndex == 2 then return side < 0 and 2 or 3 end
    return side < 0 and 4 or 5
end
