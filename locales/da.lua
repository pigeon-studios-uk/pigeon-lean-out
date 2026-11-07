--[[
    Pigeon Lean Out: Danish (Dansk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'da'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.da = {
    title = 'Læn dig ud',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Læn dig ud af vinduet / kom ind igen',

    -- Why a player can't lean out.
    cant_not_allowed = 'Du kan ikke læne dig ud af køretøjer.',
    cant_driver = 'Du kan ikke læne dig ud, mens du kører.',
    cant_seat = 'Du kan ikke læne dig ud fra dette sæde.',
    cant_vehicle = 'Du kan ikke læne dig ud af dette køretøj.',
    cant_speed = 'For hurtigt til at læne dig ud. Sænk farten til {limit} {unit} eller mindre.',

    -- While leaning out.
    weapon = 'Du kan ikke bruge dette våben, mens du læner dig ud.',
    no_seat = 'Alle sæder er optaget. Du bliver ude, indtil et bliver ledigt.',
    pulled_in = 'For hurtigt til at blive ude. Du kommer ind igen.',
    vehicle_gone = 'Køretøjet er væk.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Læn dig ud først, og brug så justeringen.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ frem {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ud {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ højde {height}~n~~INPUT_FRONTEND_RDOWN~ udskriv · ~INPUT_FRONTEND_RRIGHT~ nulstil',
    tune_saved = 'Føj dette til Config.Offsets.models (tjek, at det er køretøjets spawn-navn):',
    tune_printed = 'Skrevet i F8-konsollen.',
}
