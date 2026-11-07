--[[
    Pigeon Lean Out: German (Deutsch).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'de'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.de = {
    title = 'Rauslehnen',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Aus dem Fenster lehnen / wieder rein',

    -- Why a player can't lean out.
    cant_not_allowed = 'Du kannst dich nicht aus Fahrzeugen lehnen.',
    cant_driver = 'Du kannst dich beim Fahren nicht rauslehnen.',
    cant_seat = 'Von diesem Sitz aus kannst du dich nicht rauslehnen.',
    cant_vehicle = 'Aus diesem Fahrzeug kannst du dich nicht rauslehnen.',
    cant_speed = 'Zu schnell zum Rauslehnen. Fahr {limit} {unit} oder langsamer.',

    -- While leaning out.
    weapon = 'Diese Waffe kannst du beim Rauslehnen nicht benutzen.',
    no_seat = 'Alle Sitze sind belegt. Du bleibst draußen, bis einer frei wird.',
    pulled_in = 'Zu schnell, um draußen zu bleiben. Du kommst wieder rein.',
    vehicle_gone = 'Das Fahrzeug ist weg.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Lehn dich zuerst raus, dann nutze den Tuner.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ vor {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ raus {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ Höhe {height}~n~~INPUT_FRONTEND_RDOWN~ ausgeben · ~INPUT_FRONTEND_RRIGHT~ zurücksetzen',
    tune_saved = 'Füge das zu Config.Offsets.models hinzu (prüfe, ob es der Spawn-Name des Fahrzeugs ist):',
    tune_printed = 'In der F8-Konsole ausgegeben.',
}
