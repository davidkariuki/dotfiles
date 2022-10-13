local map = vim.api.nvim_set_keymap

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
map("n", "<C-_>", "<Plug>NERDCommenterToggle", {})
map("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>", {})
map("v", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>Y", '"+yg_', { noremap = true })
map("n", "+", "<C-a>", { noremap = true })
map("n", "-", "<C-x>", { noremap = true })

-- LSP keybinds
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    -- Jump to the definition
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    -- Jump to declaration
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    -- Lists all the implementations for the symbol under the cursor
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    -- Jumps to the definition of the type symbol
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    -- Lists all the references
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    -- Displays a function"s signature information
    bufmap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    -- Renames all references to the symbol under the cursor
    bufmap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")
    -- Selects a code action available at the current cursor position
    bufmap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap("x", "<leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
    -- Show diagnostics in a floating window
    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    -- Move to the previous diagnostic
    bufmap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    -- Move to the next diagnostic
    bufmap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  end,
})
