return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    require("nvim-autopairs").setup({})
  end,
}
