require"nvim-treesitter.configs".setup
{
  ensure_installed = {"css", "html", "json", "toml", "ruby", "python", "typescript", "javascript", "svelte", "lua"},
  ignore_install = {},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true
  }
}
