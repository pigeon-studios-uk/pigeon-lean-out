--[[
    Pigeon Lean Out: Portuguese (Português).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.pt = {
    title = 'Debruçar',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Debruçar-se da janela / voltar para dentro',

    -- Why a player can't lean out.
    cant_not_allowed = 'Não te podes debruçar para fora de veículos.',
    cant_driver = 'Não te podes debruçar enquanto conduzes.',
    cant_seat = 'Não te podes debruçar deste lugar.',
    cant_vehicle = 'Não te podes debruçar para fora deste veículo.',
    cant_speed = 'Demasiado rápido para te debruçares. Abranda para {limit} {unit} ou menos.',

    -- While leaning out.
    weapon = 'Não podes usar esta arma enquanto estás debruçado.',
    no_seat = 'Todos os lugares estão ocupados. Ficas de fora até um ficar livre.',
    pulled_in = 'Demasiado rápido para ficares de fora. A voltar para dentro.',
    vehicle_gone = 'O veículo desapareceu.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Debruça-te primeiro e depois usa o ajuste.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ frente {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ para fora {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ altura {height}~n~~INPUT_FRONTEND_RDOWN~ imprimir · ~INPUT_FRONTEND_RRIGHT~ repor',
    tune_saved = 'Adiciona isto a Config.Offsets.models (confirma que é o nome de spawn do veículo):',
    tune_printed = 'Impresso na consola F8.',
}
