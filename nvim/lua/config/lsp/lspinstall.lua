local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
      hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
      hi LspDiagnosticsVirtualTextInformation guifg=Blue ctermfg=Blue
      hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
      hi LspDiagnosticsUnderlineError gui=undercurl guisp=red term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineWarning gui=undercurl guisp=Yellow term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineInformation gui=undercurl guisp=Blue term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineHint gui=undercurl guisp=White term=undercurl cterm=undercurl
    ]], false)
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";"),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()
  -- ... and add manually installed servers
  -- table.insert(servers, "clangd")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end

    if server == "efm" then
      config = vim.tbl_extend("force", config, require "config.lsp.efm")
    end

    require"lspconfig"[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
require"lspinstall".post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
