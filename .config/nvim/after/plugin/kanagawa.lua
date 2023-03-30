require("kanagawa").setup({
  transparent = true,
  overrides = function(colors)
    local theme = colors.theme
    return {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = "none" },
      TelescopePromptBorder = { fg = "none", bg = "none" },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
      TelescopeResultsBorder = { fg = "none", bg = "none" },
      TelescopePreviewNormal = { bg = "none" },
      TelescopePreviewBorder = { bg = "none" },
    }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          float = {
            bg = "none",
          },
          bg_gutter = "none",
        },
      },
    },
  },
})
