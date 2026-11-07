--[[
    Pigeon Lean Out: Swedish (Svenska).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sv'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.sv = {
    title = 'Luta ut',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Luta ut genom fönstret / kom in igen',

    -- Why a player can't lean out.
    cant_not_allowed = 'Du kan inte luta dig ut ur fordon.',
    cant_driver = 'Du kan inte luta dig ut medan du kör.',
    cant_seat = 'Du kan inte luta dig ut från det här sätet.',
    cant_vehicle = 'Du kan inte luta dig ut ur det här fordonet.',
    cant_speed = 'För snabbt för att luta dig ut. Sakta ner till {limit} {unit} eller mindre.',

    -- While leaning out.
    weapon = 'Du kan inte använda det här vapnet medan du lutar dig ut.',
    no_seat = 'Alla säten är upptagna. Du stannar ute tills ett blir ledigt.',
    pulled_in = 'För snabbt för att stanna ute. Du kommer in igen.',
    vehicle_gone = 'Fordonet är borta.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Luta dig ut först och använd sedan justeringen.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ framåt {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ utåt {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ höjd {height}~n~~INPUT_FRONTEND_RDOWN~ skriv ut · ~INPUT_FRONTEND_RRIGHT~ återställ',
    tune_saved = 'Lägg till detta i Config.Offsets.models (kontrollera att det är fordonets spawnnamn):',
    tune_printed = 'Utskrivet i F8-konsolen.',
}
