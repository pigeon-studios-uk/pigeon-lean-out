--[[
    Pigeon Lean Out: Hungarian (Magyar).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hu'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.hu = {
    title = 'Kihajolás',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Kihajolás az ablakon / vissza',

    -- Why a player can't lean out.
    cant_not_allowed = 'Járművekből nem hajolhatsz ki.',
    cant_driver = 'Vezetés közben nem hajolhatsz ki.',
    cant_seat = 'Erről az ülésről nem hajolhatsz ki.',
    cant_vehicle = 'Ebből a járműből nem hajolhatsz ki.',
    cant_speed = 'Túl gyors vagy a kihajoláshoz. Lassíts {limit} {unit} alá.',

    -- While leaning out.
    weapon = 'Kihajolva ezt a fegyvert nem használhatod.',
    no_seat = 'Minden ülés foglalt. Kint maradsz, amíg fel nem szabadul egy.',
    pulled_in = 'Túl gyors vagy ahhoz, hogy kint maradj. Visszahúzódsz.',
    vehicle_gone = 'A jármű eltűnt.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Előbb hajolj ki, aztán használd a hangolót.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ előre {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ kifelé {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ magasság {height}~n~~INPUT_FRONTEND_RDOWN~ kiírás · ~INPUT_FRONTEND_RRIGHT~ visszaállítás',
    tune_saved = 'Add hozzá a Config.Offsets.models részhez (ellenőrizd, hogy ez a jármű spawn neve):',
    tune_printed = 'Kiírva az F8 konzolba.',
}
