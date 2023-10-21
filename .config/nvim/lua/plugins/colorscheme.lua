return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
    })

    vim.cmd.colorscheme("catppuccin-mocha")
    vim.cmd.highlight("TelescopeBorder guibg=none")
    vim.cmd.highlight("TelescopeTitle guibg=none")
  end,
}
