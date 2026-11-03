fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-lean-out'
author 'Pigeon Studios'
description 'Lets passengers lean out of the window and shoot all the way round, with any weapon you allow.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-lean-out'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-lean-out'

shared_scripts {
    'configuration/config.lua',
    'shared/rules.lua',
}

client_scripts {
    'locales/*.lua',
    'client/main.lua',
}

server_scripts {
    'server/bridge.lua',
    'server/main.lua',
    'server/version_check.lua',
}
