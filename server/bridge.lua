--[[
    Pigeon Lean Out: frameworks.

    Finds Qbox, QBCore or ESX if one is running, and reads a player's job and duty. Without a
    framework, job permissions do nothing and everything else works the same.
]]

Bridge = {}

local framework, core

local function detect()
    if framework ~= nil then return end
    if GetResourceState('qbx_core') == 'started' then
        framework = 'qbx'
    elseif GetResourceState('qb-core') == 'started' then
        framework = 'qb'
        core = exports['qb-core']:GetCoreObject()
    elseif GetResourceState('es_extended') == 'started' then
        framework = 'esx'
        core = exports.es_extended:getSharedObject()
    else
        framework = false
    end
end

local function fromQb(player)
    local job = player and player.PlayerData and player.PlayerData.job
    if not job then return nil end
    return { name = job.name, onDuty = job.onduty ~= false }
end

local readers = {
    qbx = function(source)
        return fromQb(exports.qbx_core:GetPlayer(source))
    end,
    qb = function(source)
        return fromQb(core.Functions.GetPlayer(source))
    end,
    esx = function(source)
        local player = core.GetPlayerFromId(source)
        if not player then return nil end
        local job = player.getJob and player.getJob() or player.job
        if not job then return nil end
        -- ESX versions without a duty system have no onDuty: everyone counts as on duty.
        return { name = job.name, onDuty = job.onDuty ~= false }
    end,
}

--- The framework in use: 'qbx', 'qb', 'esx' or false.
function Bridge.Framework()
    detect()
    return framework
end

--- The player's job as { name, onDuty }, or nil without a framework or a loaded character.
function Bridge.GetJob(source)
    detect()
    if not framework then return nil end
    local ok, job = pcall(readers[framework], source)
    if ok and type(job) == 'table' and job.name then return job end
    return nil
end
