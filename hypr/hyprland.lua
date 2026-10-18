-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.env("BONGOCAT_ENABLE_EVDEV", "1")

-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("caffeinate")
end)

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
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

		sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = -1,
		gaps_out = -1,
		gaps_workspaces = -1,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
	},

	decoration = {
		rounding = 0,
		rounding_power = false,

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

	-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
	dwindle = {
		preserve_split = true,
	},

	-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
	master = {
		new_status = "master",
	},

	-- https://wiki.hypr.land/Configgring/Layouts/Scrolling-Layout/
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.62,
		follow_focus = true,
		wrap_focus = true,
		wrap_swapcol = true,
		direction = "right",
		explicit_column_widths = "0.3, 0.5, 0.62, 0.73, 0.84, 1.0",
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
