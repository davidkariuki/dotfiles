local indent = 2

vim.cmd("filetype plugin indent on")

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
vim.o.termguicolors = true
vim.o.mouse = ""

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")
vim.cmd("autocmd InsertLeave * set nopaste")

-- MDX support
vim.cmd("autocmd BufNewFile,BufRead *.mdx set syntax=markdown.mdx")

-- Formatoptions
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o")

-- Colors
vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd("colorscheme kanagawa-dragon")

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.cmd("set shortmess+=c")
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end

-- Diagnostics
sign({ name = "DiagnosticSignError", text = " " })
sign({ name = "DiagnosticSignWarn", text = " " })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = " " })

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Filetypes
vim.cmd("au BufRead,BufNewFile *.mdx setfiletype markdown.mdx")
vim.cmd("au BufRead,BufNewFile *.conf,*.env* setfiletype zsh")

-- For tpipleine
vim.o.laststatus = 0
