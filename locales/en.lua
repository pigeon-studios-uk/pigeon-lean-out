--[[
    Pigeon Lean Out: English.

    To translate, copy this file to a new one named with the language's two-letter code (such as de.lua),
    change `Locales.en` to match (Locales.de), translate the text in quotes, and set Config.Locale.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.en = {
    title = 'Lean out',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Lean out of the window / come back in',

    -- Why a player can't lean out.
    cant_not_allowed = 'You can\'t lean out of vehicles.',
    cant_driver = 'You can\'t lean out while you\'re driving.',
    cant_seat = 'You can\'t lean out from this seat.',
    cant_vehicle = 'You can\'t lean out of this vehicle.',
    cant_speed = 'Too fast to lean out. Slow down to {limit} {unit} or less.',

    -- While leaning out.
    weapon = 'You can\'t use this weapon while leaning out.',
    no_seat = 'Every seat is taken. You\'ll stay out until one is free.',
    pulled_in = 'Too fast to stay out. Coming back in.',
    vehicle_gone = 'The vehicle\'s gone.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Lean out first, then use the tuner.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ forward {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ outward {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ height {height}~n~~INPUT_FRONTEND_RDOWN~ print · ~INPUT_FRONTEND_RRIGHT~ reset',
    tune_saved = 'Add this to Config.Offsets.models (check it\'s the vehicle\'s spawn name):',
    tune_printed = 'Printed to the F8 console.',
}
