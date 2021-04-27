local saga = require "lspsaga"

saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  code_action_prompt = {
    enable = false,
  },
  code_action_keys = {
    quit = {"q", "<C-c>"},
    exec = "<CR>"
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>"
  },
  definition_preview_icon = "  ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "s",
    quit = "q",
    scroll_down = "<C-j>",
    scroll_up = "<C-k>"
  },
  border_style = "round"
}

vim.cmd "autocmd CursorHold  * :Lspsaga show_line_diagnostics"
