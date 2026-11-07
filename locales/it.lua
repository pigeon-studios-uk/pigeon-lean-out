--[[
    Pigeon Lean Out: Italian (Italiano).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'it'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.it = {
    title = 'Sporgersi',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Sporgiti dal finestrino / rientra',

    -- Why a player can't lean out.
    cant_not_allowed = 'Non puoi sporgerti dai veicoli.',
    cant_driver = 'Non puoi sporgerti mentre guidi.',
    cant_seat = 'Non puoi sporgerti da questo sedile.',
    cant_vehicle = 'Non puoi sporgerti da questo veicolo.',
    cant_speed = 'Troppo veloce per sporgerti. Rallenta a {limit} {unit} o meno.',

    -- While leaning out.
    weapon = 'Non puoi usare quest\'arma mentre sei sporto.',
    no_seat = 'Tutti i sedili sono occupati. Resterai fuori finché uno non si libera.',
    pulled_in = 'Troppo veloce per restare fuori. Rientri.',
    vehicle_gone = 'Il veicolo non c\'è più.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Prima sporgiti, poi usa la regolazione.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ avanti {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ fuori {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ altezza {height}~n~~INPUT_FRONTEND_RDOWN~ stampa · ~INPUT_FRONTEND_RRIGHT~ reimposta',
    tune_saved = 'Aggiungi questo a Config.Offsets.models (controlla che sia il nome di spawn del veicolo):',
    tune_printed = 'Stampato nella console F8.',
}
