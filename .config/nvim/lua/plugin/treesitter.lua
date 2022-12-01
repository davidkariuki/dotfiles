require("nvim-treesitter.configs").setup({
  auto_install = true,
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
    "c_sharp",
    "markdown",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
  },
  autotag = {
    enable = true,
  },
})
