local tree_cb = require"nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_bindings = {
  { key = "n", cb = tree_cb("create") },
  { key = "v", cb = tree_cb("vsplit") },
  { key = "s", cb = tree_cb("split") },
  { key = "t", cb = tree_cb("tabnew") },
  { key = { "<CR>", "o" }, cb = tree_cb("edit") },
}

vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

