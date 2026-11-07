--[[
    Pigeon Lean Out: Turkish (Türkçe).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'tr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.tr = {
    title = 'Dışarı sarkma',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Camdan dışarı sark / içeri geri dön',

    -- Why a player can't lean out.
    cant_not_allowed = 'Araçlardan dışarı sarkamazsın.',
    cant_driver = 'Araç kullanırken dışarı sarkamazsın.',
    cant_seat = 'Bu koltuktan dışarı sarkamazsın.',
    cant_vehicle = 'Bu araçtan dışarı sarkamazsın.',
    cant_speed = 'Dışarı sarkmak için çok hızlısın. {limit} {unit} veya altına yavaşla.',

    -- While leaning out.
    weapon = 'Dışarı sarkarken bu silahı kullanamazsın.',
    no_seat = 'Tüm koltuklar dolu. Biri boşalana kadar dışarıda kalacaksın.',
    pulled_in = 'Dışarıda kalmak için çok hızlı. İçeri dönüyorsun.',
    vehicle_gone = 'Araç gitti.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Önce dışarı sark, sonra ayarlayıcıyı kullan.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ ileri {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ dışarı {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ yükseklik {height}~n~~INPUT_FRONTEND_RDOWN~ yazdır · ~INPUT_FRONTEND_RRIGHT~ sıfırla',
    tune_saved = 'Bunu Config.Offsets.models içine ekle (aracın spawn adı olduğunu kontrol et):',
    tune_printed = 'F8 konsoluna yazdırıldı.',
}
