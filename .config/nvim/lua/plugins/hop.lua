return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {},
  config = function()
    require("hop").setup()

    vim.keymap.set("n", "\\", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true })
  end,
}
