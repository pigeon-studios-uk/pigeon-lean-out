--[[
    Pigeon Lean Out: Simplified Chinese (简体中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-cn'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are; they're filled in
    automatically.
]]

Locales = Locales or {}

Locales['zh-cn'] = {
    title = '探身',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = '从车窗探身 / 回到车内',

    -- Why a player can't lean out.
    cant_not_allowed = '你不能从车里探身出去。',
    cant_driver = '驾驶时不能探身出去。',
    cant_seat = '你不能从这个座位探身出去。',
    cant_vehicle = '你不能从这辆车探身出去。',
    cant_speed = '车速太快，无法探身。请减速到 {limit} {unit} 或以下。',

    -- While leaning out.
    weapon = '探身时不能使用这把武器。',
    no_seat = '所有座位都有人了。你会留在外面，直到有空位。',
    pulled_in = '车速太快，无法继续探身。正在回到车内。',
    vehicle_gone = '车辆已经不见了。',

    -- The tuner (/leanouttune).
    tune_lean_first = '请先探身出去，再使用调整工具。',
    tune_help = '~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ 前后 {forward}~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ 外侧 {outward}~n~~INPUT_SCRIPTED_FLY_ZUP~ ~INPUT_SCRIPTED_FLY_ZDOWN~ 高度 {height}~n~~INPUT_FRONTEND_RDOWN~ 打印 · ~INPUT_FRONTEND_RRIGHT~ 重置',
    tune_saved = '把这段加到 Config.Offsets.models（确认这是车辆的生成名称）：',
    tune_printed = '已打印到 F8 控制台。',
}
