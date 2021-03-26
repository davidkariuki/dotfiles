local utils = require("utils")
local cmd = vim.cmd

-- colorscheme
utils.opt("o", "termguicolors", true)
utils.opt("o", "background", "dark")
cmd "colorscheme one"

-- completion
utils.opt("o", "completeopt", "menuone,noinsert,noselect")
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}

-- <Tab> to navigate the completion menu
utils.map("i", "<S-Tab>", "pumvisible() ? '\\<C-p>' : '\\<Tab>'", {expr = true})
utils.map("i", "<Tab>", "pumvisible() ? '\\<C-n>' : '\\<Tab>'", {expr = true})

-- Fugitive
utils.map("n", "<Leader>gs", "<cmd>Gstatus<CR>")  -- Git status

-- Airline
--vim.g.airline_theme = "one"
--vim.g.airline_powerline_fonts = 1

-- Emmet
vim.g.user_emmet_leader_key="<C-E>"

-- Indentline
vim.g.indentLine_char = '│'

-- Nerdcommenter
vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1

-- Nvim Tree
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_auto_open = 1 
vim.g.nvim_tree_tab_open = 1


local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["n"] = tree_cb("create")
}

-- compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
