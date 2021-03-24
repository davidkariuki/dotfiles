local utils = require("utils")

utils.map("n", "<Leader><Leader>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>")
utils.map("n", "<Leader>w", "<cmd>up<CR>")
utils.map("n", "<Leader>f", "<cmd>NvimTreeToggle<CR>")

