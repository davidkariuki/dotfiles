local notify = require("notify")

notify.setup({
  minimum_width = 30,
  timeout = 2000,
  fps = 60,
})

vim.notify = notify
