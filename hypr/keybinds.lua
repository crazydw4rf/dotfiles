-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local modKey = "SUPER"
local modAltKey = "ALT"

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local superBind = function(keys, dispatcher, opts)
	return hl.bind(modKey .. " + " .. keys, dispatcher, opts)
end

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local superShiftBind = function(key, dispatcher, opts)
	return hl.bind(modKey .. " + SHIFT + " .. key, dispatcher, opts)
end

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local altBind = function(key, dispatcher, opts)
	return hl.bind(modAltKey .. " + " .. key, dispatcher, opts)
end

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local altShiftBind = function(key, dispatcher, opts)
	return hl.bind(modAltKey .. " + SHIFT + " .. key, dispatcher, opts)
end

local fileManager = "thunar"
local terminal = "kitty -1"
local noctalia_ipc = "noctalia msg "

superBind("Return", hl.dsp.exec_cmd(terminal))
superBind("Space", hl.dsp.exec_cmd(noctalia_ipc .. "panel-open launcher"))
superBind("V", hl.dsp.exec_cmd(noctalia_ipc .. "panel-toggle clipboard"))
superBind("Q", hl.dsp.window.close())

superBind("code:59", hl.dsp.exec_cmd(noctalia_ipc .. "panel-toggle control-center")) -- ','
superBind("code:60", hl.dsp.exec_cmd(noctalia_ipc .. "settings-toggle")) -- '.'
altBind("Tab", hl.dsp.exec_cmd(noctalia_ipc .. "window-switcher"))

superShiftBind("M", hl.dsp.exit())
superBind("E", hl.dsp.exec_cmd(fileManager))
superBind("S", hl.dsp.window.float({ action = "toggle" }))
superBind("P", hl.dsp.window.pseudo())

superBind("U", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
superBind("H", hl.dsp.focus({ direction = "left" })):set_enabled(false)
superBind("L", hl.dsp.focus({ direction = "right" })):set_enabled(false)
superBind("J", hl.dsp.focus({ direction = "down" }))
superBind("K", hl.dsp.focus({ direction = "up" }))

-- Scrolling layout
superBind("mouse_down", hl.dsp.layout("move +col"))
superBind("mouse_up", hl.dsp.layout("move -col"))

superBind("H", hl.dsp.layout("focus l"))
superBind("L", hl.dsp.layout("focus r"))

superShiftBind("H", hl.dsp.layout("swapcol r"))
superShiftBind("L", hl.dsp.layout("swapcol l"))

superBind("equal", hl.dsp.layout("colresize +conf"))
superBind("minus", hl.dsp.layout("colresize -conf"))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	superBind(key, hl.dsp.focus({ workspace = i }))
	altBind(key, hl.dsp.window.move({ workspace = i }))
end

superShiftBind("minus", hl.dsp.workspace.toggle_special("magic"))
superShiftBind("equal", hl.dsp.window.move({ workspace = "special:magic" }))

superShiftBind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
superShiftBind("mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
superBind("mouse:272", hl.dsp.window.drag(), { mouse = true })
superBind("mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
