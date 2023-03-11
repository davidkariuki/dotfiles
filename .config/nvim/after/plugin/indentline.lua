vim.opt.list = true
vim.g.indent_blankline_char = "▏"

require("indent_blankline").setup({
  show_current_context = false,
  show_current_context_start = false,
  use_treesitter = true,
})
