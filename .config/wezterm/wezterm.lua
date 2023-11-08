local wezterm = require("wezterm")

return {
	font = wezterm.font("MonoLisa Nerd Font"),
	font_size = 9.5,
	window_decorations = "NONE",
	window_background_opacity = 0.98,
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	hide_tab_bar_if_only_one_tab = true,
	force_reverse_video_cursor = true,
	colors = {
		foreground = "#dcd7ba",
		background = "#16161D",
		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",
		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",
		scrollbar_thumb = "#16161d",
		split = "#16161d",
		ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
		brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
		indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	},
}
