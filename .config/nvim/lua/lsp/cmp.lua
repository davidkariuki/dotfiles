-- Setup nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Global Config
require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icons = require("lsp.icons")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = icons[vim_item.kind] or ""

      if entry.source.name == "buffer" then
        vim_item.menu = "[Buffer]"
      elseif entry.source.name == "nvim_lsp" then
        vim_item.menu = "[" .. entry.source.source.client.name .. "]"
      else
        vim_item.menu = "[" .. entry.source.name .. "]"
      end

      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  on_attach = on_attach,
}
-- Setup lspconfig
local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

lspconfig["sumneko_lua"].setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
-- LSP Servers
lspconfig.eslint.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.cssmodules_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.denols.setup({
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
lspconfig.omnisharp.setup({
  use_mono = true,
})

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Setup null-ls for formatting
require("mason-null-ls").setup({
  automatic_setup = true,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    require("typescript.extensions.null-ls.code-actions"),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi" } }),
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--indent-width", 2 },
    }),
  },
  on_attach = on_attach,
})

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = true,
})
