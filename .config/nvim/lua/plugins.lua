-- Auto-install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- Syntax / Linting
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "NvChad/nvim-colorizer.lua",
  "numToStr/Comment.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("hlargs").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-endwise",
  "rcarriga/nvim-notify",

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  },
  "nvim-telescope/telescope-ui-select.nvim",
  "kevinhwang91/nvim-bqf",

  -- LSP and completion
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
  },

  -- Drawer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  --- Statusline
  "vimpostor/vim-tpipeline",
  {
    "hoob3rt/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },

  -- Navigation
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
    config = function()
      require("hop").setup()
    end,
  },
  "christoomey/vim-tmux-navigator",

  -- Terminal
  "voldikss/vim-floaterm",

  -- Leetcode
  {
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
      lang = "ruby",
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
  },
}, {
  ui = {
    border = "rounded",
  },
})
