--[[
    Pigeon Lean Out: French (Français).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.fr = {
    title = 'Se pencher',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Se pencher par la fenêtre / revenir',

    -- Why a player can't lean out.
    cant_not_allowed = 'Vous ne pouvez pas vous pencher hors des véhicules.',
    cant_driver = 'Vous ne pouvez pas vous pencher en conduisant.',
    cant_seat = 'Vous ne pouvez pas vous pencher depuis ce siège.',
    cant_vehicle = 'Vous ne pouvez pas vous pencher hors de ce véhicule.',
    cant_speed = 'Trop rapide pour vous pencher. Ralentissez à {limit} {unit} ou moins.',

    -- While leaning out.
    weapon = 'Vous ne pouvez pas utiliser cette arme en étant penché.',
    no_seat = 'Tous les sièges sont pris. Vous restez dehors jusqu\'à ce qu\'un siège se libère.',
    pulled_in = 'Trop rapide pour rester dehors. Vous revenez à l\'intérieur.',
    vehicle_gone = 'Le véhicule a disparu.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Penchez-vous d\'abord, puis utilisez le réglage.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ avant {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ extérieur {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ hauteur {height}~n~~INPUT_FRONTEND_RDOWN~ afficher · ~INPUT_FRONTEND_RRIGHT~ réinitialiser',
    tune_saved = 'Ajoutez ceci à Config.Offsets.models (vérifiez que c\'est le nom de spawn du véhicule) :',
    tune_printed = 'Affiché dans la console F8.',
}
