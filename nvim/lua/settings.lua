local indent = 2

vim.cmd "syntax enable"
vim.cmd "filetype plugin indent on"

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
vim.o.ch = 1
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"

-- Highlight on yank
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

-- Formatoptions
vim.cmd "au BufEnter * set fo-=c fo-=r fo-=o"
vim.cmd "autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)"

-- colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd "colorscheme one"

-- completion
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
