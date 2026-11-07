--[[
    Pigeon Lean Out: Romanian (Română).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'ro'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.ro = {
    title = 'Aplecare',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Apleacă-te pe geam / revino înăuntru',

    -- Why a player can't lean out.
    cant_not_allowed = 'Nu te poți apleca în afara vehiculelor.',
    cant_driver = 'Nu te poți apleca afară în timp ce conduci.',
    cant_seat = 'Nu te poți apleca afară de pe acest loc.',
    cant_vehicle = 'Nu te poți apleca afară din acest vehicul.',
    cant_speed = 'Prea repede ca să te apleci afară. Încetinește la {limit} {unit} sau mai puțin.',

    -- While leaning out.
    weapon = 'Nu poți folosi această armă cât timp ești aplecat afară.',
    no_seat = 'Toate locurile sunt ocupate. Rămâi afară până se eliberează unul.',
    pulled_in = 'Prea repede ca să rămâi afară. Revii înăuntru.',
    vehicle_gone = 'Vehiculul a dispărut.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Apleacă-te mai întâi afară, apoi folosește reglajul.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ înainte {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ în afară {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ înălțime {height}~n~~INPUT_FRONTEND_RDOWN~ afișează · ~INPUT_FRONTEND_RRIGHT~ resetează',
    tune_saved = 'Adaugă asta în Config.Offsets.models (verifică dacă e numele de spawn al vehiculului):',
    tune_printed = 'Afișat în consola F8.',
}
