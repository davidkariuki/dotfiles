return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

    require("ibl").setup({
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    })
  end,
}
