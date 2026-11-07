--[[
    Pigeon Lean Out: Finnish (Suomi).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fi'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.fi = {
    title = 'Nojaa ulos',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Nojaa ulos ikkunasta / palaa sisään',

    -- Why a player can't lean out.
    cant_not_allowed = 'Et voi nojata ulos ajoneuvoista.',
    cant_driver = 'Et voi nojata ulos ajaessasi.',
    cant_seat = 'Et voi nojata ulos tältä istuimelta.',
    cant_vehicle = 'Et voi nojata ulos tästä ajoneuvosta.',
    cant_speed = 'Liian kova vauhti ulos nojaamiseen. Hidasta nopeuteen {limit} {unit} tai alle.',

    -- While leaning out.
    weapon = 'Et voi käyttää tätä asetta ulos nojatessasi.',
    no_seat = 'Kaikki istuimet ovat varattuja. Pysyt ulkona, kunnes jokin vapautuu.',
    pulled_in = 'Liian kova vauhti ulkona pysymiseen. Palaat sisään.',
    vehicle_gone = 'Ajoneuvo on poissa.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Nojaa ensin ulos ja käytä sitten säädintä.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ eteen {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ulos {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ korkeus {height}~n~~INPUT_FRONTEND_RDOWN~ tulosta · ~INPUT_FRONTEND_RRIGHT~ nollaa',
    tune_saved = 'Lisää tämä kohtaan Config.Offsets.models (tarkista, että se on ajoneuvon spawn-nimi):',
    tune_printed = 'Tulostettu F8-konsoliin.',
}
