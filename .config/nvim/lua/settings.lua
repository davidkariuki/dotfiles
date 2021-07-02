local indent = 2

vim.cmd "syntax enable"
vim.cmd "filetype plugin indent on"

vim.g.mapleader = " "
vim.o.undofile = true
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.hidden = true
vim.o.ruler = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 4
vim.o.shiftround = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = "list:longest"
vim.o.pastetoggle = "<Leader>p"
vim.o.equalalways = true
vim.o.ch = 1
vim.o.number = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"

-- Highlight on yank
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"
vim.cmd "autocmd InsertLeave * set nopaste"

-- MDX support
vim.cmd "autocmd BufNewFile,BufRead *.mdx set syntax=markdown.mdx"

-- Formatoptions
vim.cmd "au BufEnter * set fo-=c fo-=r fo-=o"

-- Colors
vim.g.darkbuddy_italics = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd "colorscheme darkbuddy"

-- Completion
vim.o.completeopt =  "menu,menuone,noinsert,noselect"
vim.cmd "set shortmess+=c"
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
vim.g.diagnostic_enable_underline = 1

-- LSP diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    update_in_insert = false,
  }
)

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsSignHint"})

-- Filetypes
vim.cmd "au BufRead,BufNewFile *.mdx setfiletype markdown.mdx"
vim.cmd "au BufRead,BufNewFile *.conf,*.env* setfiletype zsh"
