return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "css",
          "html",
          "json",
          "toml",
          "ruby",
          "rust",
          "python",
          "typescript",
          "javascript",
          "svelte",
          "tsx",
          "lua",
          "regex",
          "markdown",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },
}
