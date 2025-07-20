-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit editing mode" })
map("n", "<Leader>w", "<cmd>up<CR>", { noremap = true, desc = "Update file" })
map("n", "<Leader>w", "<cmd>up<CR>", { noremap = true, desc = "Update file" })
map(
  "n",
  "<leader><space>",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)
map("n", "<C-p>", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
