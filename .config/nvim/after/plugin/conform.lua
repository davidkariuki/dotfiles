require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    shell = { "shfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    graphql = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    async = false,
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
