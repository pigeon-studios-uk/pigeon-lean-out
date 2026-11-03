--[[
    Pigeon Lean Out: server.

    Works out who can lean out (Config.Allowed, or the SetAllowed export) and tells their game through a
    state bag. It's checked when a player joins, when their character loads, when their job or duty
    changes, and every Config.AllowedRefreshSeconds. It also runs /leanouttune, so the ACE permission is
    checked here.
]]

local STATE_KEY = 'pigeonLeanOutAllowed'

local jobs = {}
local overrides = {}       -- [source] = true or false, set by other resources through SetAllowed

for _, name in ipairs(Config.Allowed and Config.Allowed.jobs or {}) do
    jobs[name] = true
end

local function isAllowed(source)
    if overrides[source] ~= nil then return overrides[source] end
    local rules = Config.Allowed or {}
    if rules.everyone ~= false then return true end

    if rules.ace and rules.ace ~= '' and IsPlayerAceAllowed(source, rules.ace) then return true end

    if next(jobs) then
        local job = Bridge.GetJob(source)
        if job and jobs[job.name] and (job.onDuty or not rules.onDutyOnly) then return true end
    end
    return false
end

local function refresh(source)
    source = tonumber(source)
    if not source or source <= 0 or not GetPlayerName(source) then return end
    local value = isAllowed(source)
    local state = Player(source).state
    if state[STATE_KEY] ~= value then state:set(STATE_KEY, value, true) end
end

local function refreshAll()
    for _, id in ipairs(GetPlayers()) do refresh(id) end
end

---------------------------------------------------------------------------
-- When to check

AddEventHandler('playerJoining', function()
    refresh(source)
end)

AddEventHandler('playerDropped', function()
    overrides[source] = nil
end)

-- Qbox and QBCore.
AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
    if player and player.PlayerData then refresh(player.PlayerData.source) end
end)
AddEventHandler('QBCore:Server:OnJobUpdate', function(id) refresh(id) end)
AddEventHandler('QBCore:Server:SetDuty', function(id) refresh(id) end)

-- ESX.
AddEventHandler('esx:playerLoaded', function(id) refresh(id) end)
AddEventHandler('esx:setJob', function(id) refresh(id) end)

CreateThread(function()
    refreshAll()   -- players already on the server when the resource (re)starts
    while true do
        Wait(math.max(10, tonumber(Config.AllowedRefreshSeconds) or 60) * 1000)
        refreshAll()
    end
end)

---------------------------------------------------------------------------
-- The tuner, for staff with command.<Config.TuneCommand>

RegisterCommand(Config.TuneCommand or 'leanouttune', function(source)
    if source > 0 then TriggerClientEvent('pigeon-lean-out:tune', source) end
end, true)

---------------------------------------------------------------------------
-- Exports

--[[
    Lets a player lean out (true), stops them (false), or goes back to Config.Allowed (nil). Lasts until
    they leave the server.
        exports['pigeon-lean-out']:SetAllowed(source, true)
]]
exports('SetAllowed', function(id, value)
    id = tonumber(id)
    if not id then return end
    if value == nil then overrides[id] = nil else overrides[id] = value == true end
    refresh(id)
end)

--- True if this player can lean out right now (seat and vehicle rules still apply in their game).
exports('IsAllowed', function(id)
    id = tonumber(id)
    return id ~= nil and isAllowed(id)
end)
