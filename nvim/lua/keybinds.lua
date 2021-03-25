local utils = require("utils")

utils.map("n", "<Leader><Leader>", "<cmd>noh<CR>")
utils.map("i", "jk", "<Esc>")
utils.map("n", "<Leader>w", "<cmd>up<CR>")
utils.map("n", "<Leader>d", "<cmd>pu=strftime('%b %d, %Y %X')<CR>")
utils.map("n", "<Leader>c", "<plug>NERDCommenterToggle")
utils.map("n", "\\", "<cmd>lua require'hop'.hint_words()<cr>", {})
utils.map("n", "<Leader>f", "<cmd>NvimTreeFindFile<cr>")
utils.map("n", "<Leader>n", "<cmd>NvimTreeToggle<cr>")

