local notify = require("notify")

notify.setup({
  minimum_width = 30,
  timeout = 2000,
  fps = 60,
  render = "compact",
  stages = "fade",
})

vim.notify = notify
