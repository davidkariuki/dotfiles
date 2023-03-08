local actions = require("telescope.actions")

require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
  defaults = {
    file_ignore_patterns = { "node_modules", "dotbot" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
      },
    },
    prompt_prefix = " 🔍 ",
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    layout_strategy = "flex",
    use_less = true,
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.6,
      },
      vertical = {
        mirror = false,
      },
    },
  },
})

require("telescope").load_extension("ui-select")
