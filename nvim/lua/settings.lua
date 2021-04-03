local utils = require("utils")
local cmd = vim.cmd
local indent = 2

cmd "syntax enable"
cmd "filetype plugin indent on"

utils.opt("b", "shiftwidth", indent)
utils.opt("b", "autoindent", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "expandtab", true)
utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", indent)
utils.opt("o", "hidden", true)
utils.opt("o", "ruler", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "scrolloff", 4 )
utils.opt("o", "shiftround", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("o", "wildmode", "list:longest")
utils.opt("o", "pastetoggle", "<Leader>p")
utils.opt("o", "ch", 1)
utils.opt("w", "number", true)
utils.opt("w", "cursorline", true)
utils.opt("w", "relativenumber", true)
utils.opt("w", "wrap", false)
utils.opt("w", "signcolumn", "yes")

-- Highlight on yank
cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

-- colorscheme
utils.opt("o", "termguicolors", true)
utils.opt("o", "background", "dark")
cmd "colorscheme one"

-- completion
utils.opt("o", "completeopt", "menu,menuone,noinsert,noselect")
cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
vim.g.diagnostic_enable_underline = 1


-- <Tab> to navigate the completion menu
utils.map("i", "<S-Tab>", "pumvisible() ? '\\<C-p>' : '\\<Tab>'", {expr = true})
utils.map("i", "<Tab>", "pumvisible() ? '\\<C-n>' : '\\<Tab>'", {expr = true})

-- Formatoptions
cmd "au BufEnter * set fo-=c fo-=r fo-=o"

-- LSP diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    update_in_insert = false,
  }
)
