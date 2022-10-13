local wezterm = require("wezterm")

return {
  font = wezterm.font("MonoLisa"),
  font_size = 9.5,
  color_scheme = "darkbuddy",
  window_decorations = "NONE",
  window_background_opacity = 0.98,
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
  },
  hide_tab_bar_if_only_one_tab = true,
}
