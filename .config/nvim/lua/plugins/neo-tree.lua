return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "DaikyXendo/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_diagnostics = true,
      default_component_configs = {
        indent = { padding = 0 },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
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

    vim.keymap.set("n", "<Leader>n", "<cmd>Neotree toggle<cr>", { noremap = true })
    vim.cmd("highlight NeoTreeFloatTitle guifg=#DCD7BA guibg=#16161D")
  end,
}
