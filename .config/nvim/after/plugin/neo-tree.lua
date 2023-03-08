require("neo-tree").setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  default_component_configs = {
    indent = { padding = 0 },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = {
      width = 30,
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["n"] = "add",
      },
    },
    filtered_items = {
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
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_)
        vim.opt_local.signcolumn = "auto"
      end,
    },
  },
})