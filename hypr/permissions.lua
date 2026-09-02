-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Hyprland restart required
hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

local allowed_commands = {
	["screencopy"] = {
		"grim",
		"hyprpicker",
		"noctalia",
	},

	["plugin"] = {
		"hyprpm",
	},
}

for type, _ in pairs(allowed_commands) do
	for _, command in ipairs(allowed_commands[type]) do
		hl.permission({
			binary = "/usr/(bin|local/bin)/" .. command,
			mode = "allow",
			type = type,
		})
	end
end

hl.permission({
	binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
	mode = "allow",
	type = "screencopy",
})
