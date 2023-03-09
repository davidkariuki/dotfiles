local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true })
map("n", ",f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", { noremap = true })
map("n", "\\", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true })
map(
  "n",
  "<C-p>",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { noremap = true, silent = true }
)
map("n", "<Leader><Leader>", "<cmd>noh<CR>", { noremap = true })
map("n", "<Leader>g", "<cmd>Telescope live_grep<CR>", { noremap = true })
map("n", "<Leader>b", "<cmd>Telescope buffers<CR>", { noremap = true })
map("n", "<Leader>w", "<cmd>up<CR>", { noremap = true })
map("n", "<Leader>d", "<cmd>Telescope diagnostics<CR>", { noremap = true })
map("n", "<Leader>f", "<cmd>Neotree reveal<cr>", { noremap = true })
map("n", "<Leader>n", "<cmd>Neotree toggle<cr>", { noremap = true })
map("n", "<A-t>", "<cmd>FloatermToggle<CR>", { noremap = true, silent = true })
map("t", "<A-t>", "<C-\\><C-n><cmd>FloatermToggle<CR>", { noremap = true, silent = true })
map("n", "<A-g>", "<cmd>FloatermNew lazygit<CR>", { noremap = true, silent = true })
map("t", "<A-g>", "<C-\\><C-n><cmd>FloatermKill<CR>", { noremap = true, silent = true })
map("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", {})
map("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", {})
map("v", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>Y", '"+yg_', { noremap = true })
map("n", "+", "<C-a>", { noremap = true })
map("n", "-", "<C-x>", { noremap = true })
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- LSP keybinds
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    bufmap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bufmap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")
    bufmap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap("x", "<leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    bufmap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    bufmap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  end,
})
