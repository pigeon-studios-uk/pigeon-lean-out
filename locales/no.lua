--[[
    Pigeon Lean Out: Norwegian (Norsk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'no'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.no = {
    title = 'Len deg ut',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Len deg ut av vinduet / kom inn igjen',

    -- Why a player can't lean out.
    cant_not_allowed = 'Du kan ikke lene deg ut av kjøretøy.',
    cant_driver = 'Du kan ikke lene deg ut mens du kjører.',
    cant_seat = 'Du kan ikke lene deg ut fra dette setet.',
    cant_vehicle = 'Du kan ikke lene deg ut av dette kjøretøyet.',
    cant_speed = 'For fort til å lene deg ut. Sett ned farten til {limit} {unit} eller mindre.',

    -- While leaning out.
    weapon = 'Du kan ikke bruke dette våpenet mens du lener deg ut.',
    no_seat = 'Alle seter er opptatt. Du blir ute til ett blir ledig.',
    pulled_in = 'For fort til å bli ute. Du kommer inn igjen.',
    vehicle_gone = 'Kjøretøyet er borte.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Len deg ut først, og bruk så justeringen.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ frem {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ut {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ høyde {height}~n~~INPUT_FRONTEND_RDOWN~ skriv ut · ~INPUT_FRONTEND_RRIGHT~ tilbakestill',
    tune_saved = 'Legg dette til i Config.Offsets.models (sjekk at det er kjøretøyets spawn-navn):',
    tune_printed = 'Skrevet til F8-konsollen.',
}
