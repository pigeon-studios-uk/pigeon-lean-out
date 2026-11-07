Config = {}

-- Language for the text players see. 'auto' follows ox_lib's language (setr ox:locale "de" in
-- server.cfg) and is English when that isn't set. Or name a file from locales/, such as 'de' or 'pt-br'.
Config.Locale = 'auto'

---------------------------------------------------------------------------
-- Leaning out

-- The key players press to lean out of the window and to come back in. Players can change it in
-- GTA's Settings -> Key Bindings -> FiveM. Codes: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
-- The command (/leanout) works too.
Config.Key = 'G'
Config.Command = 'leanout'

-- Which seats can lean out. The driver never can: someone has to drive.
-- 'front' is the front passenger seat, 'rear' every seat behind it.
Config.Seats = {
    front = true,
    rear = true,
}

-- Fastest the vehicle can be going for a player to lean out, in Config.SpeedUnit. 0 for no limit.
Config.MaxSpeed = 0

-- Bring players back in automatically when the vehicle goes faster than this. 0 never does.
Config.PullInAboveSpeed = 0

-- The unit for both speeds: 'mph' or 'kmh'.
Config.SpeedUnit = 'mph'

-- Roll down the window beside the player when they lean out.
Config.RollDownWindow = true

---------------------------------------------------------------------------
-- Aiming

-- How far round players can turn to aim, in degrees, centred on straight out of their window.
-- 360 is all the way round, over the roof and behind them. 180 is everything on their side.
Config.AimArc = 360

-- Which weapons can be used while leaning out. Unlike drive-bys from a seat, any weapon works,
-- including rifles and shotguns.
--   mode = 'all'    any weapon
--   mode = 'allow'  only the weapons and groups in list
--   mode = 'block'  any weapon, except those in list
-- list takes weapon names ('WEAPON_CARBINERIFLE') and weapon groups ('GROUP_RIFLE'). The groups are
-- GROUP_PISTOL, GROUP_SMG, GROUP_RIFLE, GROUP_SHOTGUN, GROUP_MG, GROUP_SNIPER, GROUP_HEAVY,
-- GROUP_THROWN and GROUP_MELEE.
Config.Weapons = {
    mode = 'block',
    list = {
        'GROUP_HEAVY',   -- rocket launchers, grenade launchers, miniguns
    },
}

-- Switch to first person while leaning out, and back to the player's own view when they come in.
Config.FirstPerson = false

---------------------------------------------------------------------------
-- Vehicles

Config.Vehicles = {
    -- Vehicle classes nobody can lean out of. Motorcycles, cycles, boats, helicopters, planes and
    -- trains are blocked by default: they have no windows to lean out of, or GTA's own seats already
    -- let passengers shoot. The full list: https://docs.fivem.net/natives/?_0x29439776AAA00A62
    -- 8 motorcycles · 13 cycles · 14 boats · 15 helicopters · 16 planes · 21 trains
    blockClasses = { 8, 13, 14, 15, 16, 21 },

    -- Vehicles nobody can lean out of, by spawn name. Add-on vehicles work the same way.
    blockModels = {
        -- 'bus',
    },

    -- Vehicles that are never blocked by blockClasses.
    allowModels = {
        -- 'dinghy',
    },
}

---------------------------------------------------------------------------
-- Where players sit on the window

-- Where the character goes, in metres, measured from where they were sitting:
--   outward  from the side of the vehicle: negative is inside the body, so the waist is in the window
--   forward  along the vehicle: positive towards the front
--   height   above the seat: more puts more of the character out of the window
-- default covers most cars. classes (by number) and models (by spawn name) fill in or override it,
-- for vehicles with higher or lower windows. Use /leanouttune in game to find the right numbers.
Config.Offsets = {
    default = { outward = -0.2, forward = 0.0, height = 0.35 },
    classes = {
        [2]  = { height = 0.45 },   -- SUVs
        [9]  = { height = 0.45 },   -- off-road
        [12] = { height = 0.5 },    -- vans
        [18] = { height = 0.4 },    -- emergency
        [20] = { height = 0.55 },   -- commercial
    },
    models = {
        -- ['sultan'] = { outward = -0.2, forward = 0.0, height = 0.3 },
    },
}

---------------------------------------------------------------------------
-- Who can lean out

Config.Allowed = {
    -- true lets everyone lean out. false only those with the ACE permission or a job below.
    everyone = true,

    -- Players with this ACE permission can lean out when everyone is false, granted in server.cfg:
    --     add_ace group.admin pigeon-lean-out.use allow
    ace = 'pigeon-lean-out.use',

    -- Jobs that can lean out when everyone is false, with Qbox, QBCore or ESX. Use {} for none.
    jobs = {
        -- 'police',
    },

    -- Jobs only while on duty. ESX versions without a duty system count everyone as on duty.
    onDutyOnly = true,
}

-- How often, in seconds, permissions are checked again, as well as whenever a job or duty changes.
Config.AllowedRefreshSeconds = 60

---------------------------------------------------------------------------
-- Finding the right position

-- /leanouttune, for staff: while leaning out, the arrow keys and Page Up / Page Down move the character,
-- and Enter prints the line to put in Config.Offsets.models in the F8 console. Grant it in server.cfg:
--     add_ace group.admin command.leanouttune allow
Config.TuneCommand = 'leanouttune'

---------------------------------------------------------------------------
-- Messages

-- Tell players why they can't lean out, or why they were brought back in.
Config.ShowMessages = true

-- How messages are shown.
-- 'auto' uses ox_lib notifications if ox_lib is running, otherwise GTA's notification feed.
-- 'ox_lib' or 'gta' to force one.
Config.Notifications = 'auto'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
