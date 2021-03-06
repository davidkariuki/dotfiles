local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local shellcheck = {
  lintCommand = 'shellcheck -f gcc -x',
  lintSource = "shellcheck",
  lintFormats = {
    '%f:%l:%c: %error: %m',
    '%f:%l:%c: %warning: %m',
    '%f:%l:%c: %note: %m'
  },
}

local languages = {
  sh = {shellcheck},
  vue = {prettier, eslint},
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  svelte = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true
  },
  settings = {
    rootMarkers = { ".git/", "package.json", "yarn.lock", "Dockerfile", "README.md" },
    languages = languages,
    log_level = 1,
    log_file = "~/efm.log",
  }
}
