return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
      mappings = false,
    })

    vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", {})
    vim.keymap.set("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", {})
  end,
}
