return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--glob",
          "!**/.git/*",
        },
        path_display = { "truncate " },
        file_ignore_patterns = { "node_modules", "vendor", "dist", "build", "dotbot" },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        },
      },
    })

    telescope.load_extension("fzf")

    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", {})
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {})
    vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {})
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", {})
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})
  end,
}
