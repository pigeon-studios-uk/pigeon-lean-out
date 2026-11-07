--[[
    Pigeon Lean Out: Polish (Polski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.pl = {
    title = 'Wychylenie',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Wychyl się przez okno / wróć do środka',

    -- Why a player can't lean out.
    cant_not_allowed = 'Nie możesz wychylać się z pojazdów.',
    cant_driver = 'Nie możesz się wychylać podczas jazdy.',
    cant_seat = 'Nie możesz się wychylić z tego miejsca.',
    cant_vehicle = 'Nie możesz się wychylić z tego pojazdu.',
    cant_speed = 'Za szybko, żeby się wychylić. Zwolnij do {limit} {unit} lub mniej.',

    -- While leaning out.
    weapon = 'Nie możesz używać tej broni, gdy jesteś wychylony.',
    no_seat = 'Wszystkie miejsca są zajęte. Zostaniesz na zewnątrz, aż któreś się zwolni.',
    pulled_in = 'Za szybko, żeby zostać na zewnątrz. Wracasz do środka.',
    vehicle_gone = 'Pojazd zniknął.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Najpierw się wychyl, potem użyj ustawiania.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ do przodu {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ na zewnątrz {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ wysokość {height}~n~~INPUT_FRONTEND_RDOWN~ wypisz · ~INPUT_FRONTEND_RRIGHT~ resetuj',
    tune_saved = 'Dodaj to do Config.Offsets.models (sprawdź, czy to nazwa spawnu pojazdu):',
    tune_printed = 'Wypisano w konsoli F8.',
}
