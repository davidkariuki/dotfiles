return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim", opt = true }

  -- Syntax / Linting
  use { "davidkariuki/darkbuddy", requires = "tjdevries/colorbuddy.vim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "p00f/nvim-ts-rainbow" }
  use { "RRethy/vim-hexokinase", run = "make hexokinase"}
  use { "jiangmiao/auto-pairs" }
  use { "preservim/nerdcommenter" }
  use { "Yggdroot/indentLine" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "mattn/emmet-vim" }
  use { "tpope/vim-surround" }
  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{ "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }}
  }
  use { "kevinhwang91/nvim-bqf" }

  -- LSP and completion
  use { "neovim/nvim-lspconfig" }
  use { "kabouzeid/nvim-lspinstall" }
  use { "hrsh7th/nvim-compe" }
  use { "onsails/lspkind-nvim" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Drawer
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }

  --- Statusline
  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Navigation
  use { "phaazon/hop.nvim" }
  use { "christoomey/vim-tmux-navigator" }

  -- Terminal
  use { "voldikss/vim-floaterm" }
end)

