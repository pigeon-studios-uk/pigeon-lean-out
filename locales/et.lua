--[[
    Pigeon Lean Out: Estonian (Eesti).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'et'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.et = {
    title = 'Välja kummardumine',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Kummardu aknast välja / tule tagasi sisse',

    -- Why a player can't lean out.
    cant_not_allowed = 'Sõidukitest ei saa välja kummarduda.',
    cant_driver = 'Sõites ei saa välja kummarduda.',
    cant_seat = 'Sellelt istmelt ei saa välja kummarduda.',
    cant_vehicle = 'Sellest sõidukist ei saa välja kummarduda.',
    cant_speed = 'Välja kummardumiseks liiga kiire. Aeglusta {limit} {unit} või vähemaks.',

    -- While leaning out.
    weapon = 'Väljas olles ei saa seda relva kasutada.',
    no_seat = 'Kõik istmed on hõivatud. Jääd välja, kuni mõni vabaneb.',
    pulled_in = 'Väljas püsimiseks liiga kiire. Tuled tagasi sisse.',
    vehicle_gone = 'Sõiduk on kadunud.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Kummardu enne välja, siis kasuta häälestajat.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ ette {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ välja {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ kõrgus {height}~n~~INPUT_FRONTEND_RDOWN~ prindi · ~INPUT_FRONTEND_RRIGHT~ lähtesta',
    tune_saved = 'Lisa see Config.Offsets.models alla (kontrolli, et see on sõiduki spawn-nimi):',
    tune_printed = 'Prinditud F8 konsooli.',
}
