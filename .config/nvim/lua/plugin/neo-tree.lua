require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = {
    window = {
      width = 30,
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["n"] = "add",
      },
    },
    filtered_items = {
      use_libuv_file_watcher = true,
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        "node_modules",
      },
      hide_by_pattern = {
        "*.meta",
      },
      never_show = {
        ".DS_Store",
        "thumbs.db",
      },
    },
  },
})
