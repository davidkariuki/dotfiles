local wezterm = require("wezterm")
local mux = wezterm.mux
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#181825"

wezterm.on("gui-startup", function(cmd)
	---@diagnostic disable-next-line: unused-local
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	enable_wayland = false,
	font = wezterm.font("MonoLisa Nerd Font"),
	font_size = 9.5,
	window_decorations = "NONE",
	window_background_opacity = 0.95,
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	hide_tab_bar_if_only_one_tab = true,
	force_reverse_video_cursor = true,
	color_schemes = {
		["Catppuccino Mocha"] = custom,
	},
	color_scheme = "Catppuccino Mocha",
}
