return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "kevinhwang91/nvim-bqf",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor", "dist", "build", "dotbot" },
        path_display = { "truncate " },
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
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local map = vim.keymap.set

    map(
      "n",
      "<C-p>",
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      { noremap = true, silent = true }
    )
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {})
    map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {})
    map("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})
  end,
}
