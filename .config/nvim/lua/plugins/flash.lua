return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    modes = {
      search = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      "\\",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Search",
    },
  },
}
