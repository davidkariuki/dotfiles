return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.8
    vim.cmd("hi FloatermBorder guifg=#b4befe")
    vim.keymap.set("n", "<leader>t", "<cmd>FloatermToggle<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<leader>t", "<C-\\><C-n><cmd>FloatermToggle<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>g", "<cmd>FloatermNew lazygit<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<leader>g", "<C-\\><C-n><cmd>FloatermKill<CR>", { noremap = true, silent = true })
  end,
}
