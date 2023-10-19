return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    domain = "com",
    arg = "leetcode.nvim",
    lang = "typescript",
    sql = "mysql",
    directory = vim.fn.stdpath("data") .. "/leetcode/",
    logging = true,

    console = {
      open_on_runcode = true,

      size = {
        width = "75%",
        height = "75%",
      },
      dir = "row",
    },

    description = {
      width = "40%",
    },
  },
}
