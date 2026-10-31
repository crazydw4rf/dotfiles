-- https://wiki.hypr.land/Configuring/Basics/Binds/

local modKey = "SUPER"
local modAltKey = "ALT"

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local function bind_super(keys, dispatcher, opts)
	return hl.bind(modKey .. " + " .. keys, dispatcher, opts)
end

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local function bind_super_shift(key, dispatcher, opts)
	return hl.bind(modKey .. " + SHIFT + " .. key, dispatcher, opts)
end

---@type fun(key: string|number, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind
local function bind_alt(key, dispatcher, opts)
	return hl.bind(modAltKey .. " + " .. key, dispatcher, opts)
end

---@type fun(message: string): HL.Dispatcher
local function noctalia_ipc(message)
	return hl.dsp.exec_cmd("noctalia msg " .. message)
end

local fileManager = "thunar"
local terminal = "kitty -1"

bind_super("Return", hl.dsp.exec_cmd(terminal))
bind_super("Space", noctalia_ipc("panel-toggle launcher"))
bind_super("V", noctalia_ipc("panel-toggle clipboard"))
bind_super("B", noctalia_ipc("bar-toggle"))
bind_super("Backspace", noctalia_ipc("panel-toggle session"))
bind_super_shift("P", hl.dsp.window.pin())
bind_super("Q", hl.dsp.window.close())
bind_super("Z", function()
	local active = hl.get_active_window()
	local is_floating = active and active.floating or false
	hl.dispatch(hl.dsp.window.cycle_next({ floating = not is_floating }))
end)

bind_super("Comma", noctalia_ipc("panel-toggle control-center"))
bind_super("Period", noctalia_ipc("settings-toggle"))
bind_alt("Tab", noctalia_ipc("window-switcher"))

bind_super_shift("S", noctalia_ipc("screenshot-region"))
bind_super_shift("A", noctalia_ipc("screenshot-fullscreen"))

bind_super_shift("M", hl.dsp.exit())
bind_super("E", hl.dsp.exec_cmd(fileManager))
bind_super("S", hl.dsp.window.float({ action = "toggle" }))
bind_super("P", hl.dsp.window.pseudo())
bind_super("D", hl.dsp.focus({ workspace = 99 }))
bind_super("U", hl.dsp.layout("togglesplit")) --- dwindle layout only

-- Scrolling layout
bind_super("mouse_down", hl.dsp.layout("move +col"))
bind_super("mouse_up", hl.dsp.layout("move -col"))

bind_super("H", hl.dsp.layout("focus l"))
bind_super("J", hl.dsp.layout("focus b"))
bind_super("K", hl.dsp.layout("focus t"))
bind_super("L", hl.dsp.layout("focus r"))

bind_super_shift("J", hl.dsp.layout("swapcol l"))
bind_super_shift("K", hl.dsp.layout("swapcol r"))

bind_super("equal", hl.dsp.layout("colresize +conf"))
bind_super("minus", hl.dsp.layout("colresize -conf"))

bind_super("code:34", hl.dsp.layout("consume_or_expel prev")) -- [
bind_super("code:35", hl.dsp.layout("consume_or_expel next")) -- ]

bind_super("F", hl.dsp.layout("colresize 1"))
bind_super_shift("F", hl.dsp.window.fullscreen())

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind_super(key, hl.dsp.focus({ workspace = i }))
	bind_alt(key, hl.dsp.window.move({ workspace = i }))
end

bind_super_shift("minus", hl.dsp.workspace.toggle_special("magic"))
bind_super_shift("equal", hl.dsp.window.move({ workspace = "special:magic" }))

bind_super_shift("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind_super_shift("mouse_up", hl.dsp.focus({ workspace = "e-1" }))
bind_super_shift("H", hl.dsp.focus({ workspace = "e-1" }))
bind_super_shift("L", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind_super("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind_super("mouse:273", hl.dsp.window.resize(), { mouse = true })

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
