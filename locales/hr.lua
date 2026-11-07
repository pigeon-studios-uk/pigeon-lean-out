--[[
    Pigeon Lean Out: Croatian (Hrvatski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.hr = {
    title = 'Nagnuti se van',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Nagni se kroz prozor / vrati se unutra',

    -- Why a player can't lean out.
    cant_not_allowed = 'Ne možeš se naginjati iz vozila.',
    cant_driver = 'Ne možeš se naginjati dok voziš.',
    cant_seat = 'Ne možeš se nagnuti s ovog sjedala.',
    cant_vehicle = 'Ne možeš se nagnuti iz ovog vozila.',
    cant_speed = 'Prebrzo za naginjanje. Uspori na {limit} {unit} ili manje.',

    -- While leaning out.
    weapon = 'Ovo oružje ne možeš koristiti dok si nagnut van.',
    no_seat = 'Sva su sjedala zauzeta. Ostat ćeš vani dok se jedno ne oslobodi.',
    pulled_in = 'Prebrzo da bi ostao vani. Vraćaš se unutra.',
    vehicle_gone = 'Vozilo je nestalo.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Prvo se nagni van, zatim koristi podešavanje.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ naprijed {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ van {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ visina {height}~n~~INPUT_FRONTEND_RDOWN~ ispiši · ~INPUT_FRONTEND_RRIGHT~ resetiraj',
    tune_saved = 'Dodaj ovo u Config.Offsets.models (provjeri da je to spawn ime vozila):',
    tune_printed = 'Ispisano u F8 konzolu.',
}
