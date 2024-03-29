return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        RGB = true,                                    -- #RGB hex codes
        RRGGBB = true,                                 -- #RRGGBB hex codes
        names = false,                                 -- "Name" codes like Blue or blue
        RRGGBBAA = true,                               -- #RRGGBBAA hex codes
        AARRGGBB = true,                               -- 0xAARRGGBB hex codes
        hsl_fn = true,                                 -- CSS hsl() and hsla() functions
        css = true,                                    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        mode = "virtualtext",                          -- Set the display mode.
        tailwind = true,                               -- Enable tailwind colors
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
      },
    })
  end,
}
