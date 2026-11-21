-- Run Ruby LSP inside the project's bundle so ruby-lsp-rails is loaded.
-- Ruby LSP's built-in RuboCop addon provides diagnostics; the separate
-- RuboCop LSP would duplicate them.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { "bundle", "exec", "ruby-lsp" },
        },
        rubocop = {
          enabled = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        rubocop = {
          command = "bundle",
          args = {
            "exec",
            "rubocop",
            "--server",
            "-a",
            "-f",
            "quiet",
            "--stderr",
            "--stdin",
            "$FILENAME",
          },
        },
      },
    },
  },
}
