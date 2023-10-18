return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
      keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
      keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts) -- smart rename
      keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
      keymap.set("n", "gn", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lsp_defaults = {
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }
    -- Setup lspconfig
    lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

    lspconfig.lua_ls.setup({
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
    lspconfig.html.setup({})
    lspconfig.eslint.setup({})
    lspconfig.emmet_ls.setup({})
    lspconfig.cssls.setup({})
    lspconfig.cssmodules_ls.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.solargraph.setup({})
    lspconfig.rust_analyzer.setup({})

    -- Diagnostics
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
      },
    })

    -- configure emmet language server
    lspconfig.emmet_ls.setup({
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure python server
    lspconfig.pyright.setup({})

    -- configure lua server (with special settings)
    lspconfig.lua_ls.setup({
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
