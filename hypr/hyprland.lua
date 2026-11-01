hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("caffeinate")
 	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

require("animation")
require("keybinds")
require("window_rules")
require("permissions")

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0.5, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.config({
	general = {
		gaps_in = -1,
		gaps_out = -1,
		gaps_workspaces = 1,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = true,
		allow_tearing = false,
	},

	decoration = {
		rounding = 0,
		rounding_power = 1,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = { enabled = false },

		blur = {
			enabled = true,
			size = 2,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
		workspace_wraparound = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		focus_on_activate = true,
		disable_hyprland_logo = true,
	},
})

hl.config({
	general = {
		layout = "scrolling",
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = false,
		column_width = 0.73,
		follow_focus = true,
		wrap_focus = true,
		wrap_swapcol = true,
		direction = "right",
		explicit_column_widths = "0.3, 0.5, 0.6, 0.7, 0.8, 1",
	},
})

hl.gesture({
	fingers = 3,
	mods = "SUPER",
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "swipe",
	action = "scroll_move",
})

hl.gesture({
	fingers = 2,
	mods = "SUPER",
	direction = "pinch",
	action = "cursor_zoom",
	zoom_level = 2,
	mode = "live",
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
