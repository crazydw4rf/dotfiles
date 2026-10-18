-- Ignore maximize requests from all apps. You'll probably like this.
local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.layer_rule({
	name = "noctalia bar",
	match = {
		namespace = "noctalia-bar-default",
	},
	xray = false,
	dim_around = false,
	order = 9999,
})

hl.window_rule({
	match = { class = ".*" },
	no_blur = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.window_rule({
	match = { fullscreen = 2 },
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = { class = "kitty" },
	opacity = 0.97333,
	no_blur = false,
})

--[[hl.window_rule({
	match = { class = "steam_app_default" },
	workspace = "9 silent",
})]]

hl.window_rule({
	match = { title = "FarCry" },
	workspace = "2 silent",
})

hl.window_rule({
	match = { title = "BongoCat" },
	border_size = -1,
	pin = true,
	no_close_for = 1,
	no_initial_focus = true,
	no_follow_mouse = true,
	no_focus = true,
	decorate = false,
	move = { 9999, 9999 },
})

hl.window_rule({
	match = { title = "BongoCat.+" },
	border_size = -1,
})

hl.window_rule({
	match = { class = "floatlrc" },
	border_size = -1,
})

hl.window_rule({
	match = { class = "(thunar|Thunar)", title = "(Rename|Move|Copy).*" },
	float = true,
})
