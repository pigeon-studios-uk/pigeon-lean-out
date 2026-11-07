--[[
    Pigeon Lean Out: Traditional Chinese (繁體中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-tw'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales['zh-tw'] = {
    title = '探身',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = '從車窗探身 / 回到車內',

    -- Why a player can't lean out.
    cant_not_allowed = '你不能從車裡探身出去。',
    cant_driver = '駕駛時不能探身出去。',
    cant_seat = '你不能從這個座位探身出去。',
    cant_vehicle = '你不能從這輛車探身出去。',
    cant_speed = '車速太快，無法探身。請減速到 {limit} {unit} 或以下。',

    -- While leaning out.
    weapon = '探身時不能使用這把武器。',
    no_seat = '所有座位都有人了。你會留在外面，直到有空位。',
    pulled_in = '車速太快，無法繼續探身。正在回到車內。',
    vehicle_gone = '車輛已經不見了。',

    -- The tuner (/leanouttune).
    tune_lean_first = '請先探身出去，再使用調整工具。',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ 前後 {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ 外側 {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ 高度 {height}~n~~INPUT_FRONTEND_RDOWN~ 列印 · ~INPUT_FRONTEND_RRIGHT~ 重設',
    tune_saved = '把這段加到 Config.Offsets.models（確認這是車輛的生成名稱）：',
    tune_printed = '已列印到 F8 主控台。',
}
