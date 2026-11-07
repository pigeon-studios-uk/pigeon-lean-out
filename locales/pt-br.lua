--[[
    Pigeon Lean Out: Brazilian Portuguese (Português do Brasil).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt-br'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales['pt-br'] = {
    title = 'Se debruçar',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Se debruçar na janela / voltar para dentro',

    -- Why a player can't lean out.
    cant_not_allowed = 'Você não pode se debruçar para fora de veículos.',
    cant_driver = 'Você não pode se debruçar enquanto dirige.',
    cant_seat = 'Você não pode se debruçar deste banco.',
    cant_vehicle = 'Você não pode se debruçar para fora deste veículo.',
    cant_speed = 'Rápido demais para se debruçar. Reduza para {limit} {unit} ou menos.',

    -- While leaning out.
    weapon = 'Você não pode usar esta arma enquanto está debruçado.',
    no_seat = 'Todos os bancos estão ocupados. Você fica para fora até um ficar livre.',
    pulled_in = 'Rápido demais para ficar para fora. Voltando para dentro.',
    vehicle_gone = 'O veículo sumiu.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Se debruce primeiro, depois use o ajuste.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ frente {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ para fora {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ altura {height}~n~~INPUT_FRONTEND_RDOWN~ imprimir · ~INPUT_FRONTEND_RRIGHT~ redefinir',
    tune_saved = 'Adicione isto em Config.Offsets.models (confira se é o nome de spawn do veículo):',
    tune_printed = 'Impresso no console F8.',
}
