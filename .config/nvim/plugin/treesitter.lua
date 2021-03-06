require"nvim-treesitter.configs".setup
{
  ensure_installed = {"css", "html", "json", "toml", "ruby", "rust", "python", "typescript", "javascript", "svelte", "tsx", "lua", "regex"},
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
