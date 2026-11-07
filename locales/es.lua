--[[
    Pigeon Lean Out: Spanish (Español).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'es'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.es = {
    title = 'Asomarse',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Asomarse por la ventanilla / volver a entrar',

    -- Why a player can't lean out.
    cant_not_allowed = 'No puedes asomarte de los vehículos.',
    cant_driver = 'No puedes asomarte mientras conduces.',
    cant_seat = 'No puedes asomarte desde este asiento.',
    cant_vehicle = 'No puedes asomarte de este vehículo.',
    cant_speed = 'Vas demasiado rápido para asomarte. Reduce a {limit} {unit} o menos.',

    -- While leaning out.
    weapon = 'No puedes usar esta arma mientras estás asomado.',
    no_seat = 'Todos los asientos están ocupados. Seguirás fuera hasta que quede uno libre.',
    pulled_in = 'Demasiado rápido para seguir fuera. Vuelves a entrar.',
    vehicle_gone = 'El vehículo ya no está.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Asómate primero y luego usa el ajustador.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ adelante {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ hacia fuera {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ altura {height}~n~~INPUT_FRONTEND_RDOWN~ imprimir · ~INPUT_FRONTEND_RRIGHT~ restablecer',
    tune_saved = 'Añade esto a Config.Offsets.models (comprueba que es el nombre de spawn del vehículo):',
    tune_printed = 'Impreso en la consola F8.',
}
