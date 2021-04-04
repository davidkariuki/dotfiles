local tree_cb = require"nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_bindings = {
  ["n"] = tree_cb("create"),
  ["v"] = tree_cb("vsplit"),
  ["s"] = tree_cb("split"),
  ["t"] = tree_cb("tabnew"),
}

vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

