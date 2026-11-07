--[[
    Pigeon Lean Out: Czech (Čeština).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'cs'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.cs = {
    title = 'Vyklonění',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Vyklonit se z okna / vrátit se dovnitř',

    -- Why a player can't lean out.
    cant_not_allowed = 'Z vozidel se vyklánět nemůžeš.',
    cant_driver = 'Při řízení se vyklánět nemůžeš.',
    cant_seat = 'Z tohoto sedadla se vyklonit nemůžeš.',
    cant_vehicle = 'Z tohoto vozidla se vyklonit nemůžeš.',
    cant_speed = 'Na vyklonění jedeš moc rychle. Zpomal na {limit} {unit} nebo méně.',

    -- While leaning out.
    weapon = 'Při vyklonění tuto zbraň použít nemůžeš.',
    no_seat = 'Všechna sedadla jsou obsazená. Zůstaneš venku, dokud se nějaké neuvolní.',
    pulled_in = 'Moc rychle na to, abys zůstal venku. Vracíš se dovnitř.',
    vehicle_gone = 'Vozidlo zmizelo.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Nejdřív se vykloň, pak použij ladění.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ dopředu {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ven {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ výška {height}~n~~INPUT_FRONTEND_RDOWN~ vypsat · ~INPUT_FRONTEND_RRIGHT~ reset',
    tune_saved = 'Přidej tohle do Config.Offsets.models (zkontroluj, že je to spawn název vozidla):',
    tune_printed = 'Vypsáno do konzole F8.',
}
