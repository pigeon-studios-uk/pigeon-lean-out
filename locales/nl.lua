--[[
    Pigeon Lean Out: Dutch (Nederlands).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'nl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.nl = {
    title = 'Naar buiten leunen',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Uit het raam leunen / weer naar binnen',

    -- Why a player can't lean out.
    cant_not_allowed = 'Je kunt niet uit voertuigen leunen.',
    cant_driver = 'Je kunt niet naar buiten leunen terwijl je rijdt.',
    cant_seat = 'Je kunt niet naar buiten leunen vanaf deze stoel.',
    cant_vehicle = 'Je kunt niet uit dit voertuig leunen.',
    cant_speed = 'Te snel om naar buiten te leunen. Rijd {limit} {unit} of langzamer.',

    -- While leaning out.
    weapon = 'Je kunt dit wapen niet gebruiken terwijl je naar buiten leunt.',
    no_seat = 'Alle stoelen zijn bezet. Je blijft buiten tot er een vrijkomt.',
    pulled_in = 'Te snel om buiten te blijven. Je komt weer naar binnen.',
    vehicle_gone = 'Het voertuig is weg.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Leun eerst naar buiten en gebruik dan de tuner.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ vooruit {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ naar buiten {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ hoogte {height}~n~~INPUT_FRONTEND_RDOWN~ printen · ~INPUT_FRONTEND_RRIGHT~ resetten',
    tune_saved = 'Voeg dit toe aan Config.Offsets.models (controleer of het de spawnnaam van het voertuig is):',
    tune_printed = 'Geprint in de F8-console.',
}
