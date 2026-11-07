--[[
    Pigeon Lean Out: Indonesian (Bahasa Indonesia).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'id'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales.id = {
    title = 'Mencondong keluar',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Mencondong keluar jendela / masuk lagi',

    -- Why a player can't lean out.
    cant_not_allowed = 'Kamu tidak bisa mencondong keluar dari kendaraan.',
    cant_driver = 'Kamu tidak bisa mencondong keluar saat mengemudi.',
    cant_seat = 'Kamu tidak bisa mencondong keluar dari kursi ini.',
    cant_vehicle = 'Kamu tidak bisa mencondong keluar dari kendaraan ini.',
    cant_speed = 'Terlalu cepat untuk mencondong keluar. Pelankan sampai {limit} {unit} atau kurang.',

    -- While leaning out.
    weapon = 'Kamu tidak bisa memakai senjata ini saat mencondong keluar.',
    no_seat = 'Semua kursi terisi. Kamu tetap di luar sampai ada yang kosong.',
    pulled_in = 'Terlalu cepat untuk tetap di luar. Kembali masuk.',
    vehicle_gone = 'Kendaraannya sudah hilang.',

    -- The tuner (/leanouttune).
    tune_lean_first = 'Mencondong keluar dulu, lalu pakai penyetel.',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ maju {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ keluar {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ tinggi {height}~n~~INPUT_FRONTEND_RDOWN~ cetak · ~INPUT_FRONTEND_RRIGHT~ atur ulang',
    tune_saved = 'Tambahkan ini ke Config.Offsets.models (pastikan itu nama spawn kendaraan):',
    tune_printed = 'Dicetak ke konsol F8.',
}
