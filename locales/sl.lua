--[[
    Pigeon Lean Out: Slovenian (Slovenščina).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.sl = {
    title = 'Nagib ven',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Nagni se skozi okno / vrni se noter',

    -- Why a player can't lean out.
    cant_not_allowed = 'Iz vozil se ne moreš nagibati.',
    cant_driver = 'Med vožnjo se ne moreš nagniti ven.',
    cant_seat = 'S tega sedeža se ne moreš nagniti ven.',
    cant_vehicle = 'Iz tega vozila se ne moreš nagniti ven.',
    cant_speed = 'Prehitro za nagib ven. Upočasni na {limit} {unit} ali manj.',

    -- While leaning out.
    weapon = 'Tega orožja ne moreš uporabiti, ko si nagnjen ven.',
    no_seat = 'Vsi sedeži so zasedeni. Ostaneš zunaj, dokler se kateri ne sprosti.',
    pulled_in = 'Prehitro, da bi ostal zunaj. Vračaš se noter.',
    vehicle_gone = 'Vozila ni več.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Najprej se nagni ven, nato uporabi nastavljanje.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ naprej {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ven {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ višina {height}~n~~INPUT_FRONTEND_RDOWN~ izpiši · ~INPUT_FRONTEND_RRIGHT~ ponastavi',
    tune_saved = 'Dodaj to v Config.Offsets.models (preveri, da je to spawn ime vozila):',
    tune_printed = 'Izpisano v konzolo F8.',
}
