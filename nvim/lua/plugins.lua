return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim", opt = true }

  -- Syntax / Linting
  use { "rakr/vim-one" }
  use { "glepnir/galaxyline.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "p00f/nvim-ts-rainbow" }
  use { "RRethy/vim-hexokinase", run = "make hexokinase"}
  use { "jiangmiao/auto-pairs" }
  use { "preservim/nerdcommenter" }
  use { "Yggdroot/indentLine" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "mattn/emmet-vim" }
  use { "tpope/vim-surround" }
  use { "karb94/neoscroll.nvim" }
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
  use { "glepnir/lspsaga.nvim" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Drawer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {{ "kyazdani42/nvim-web-devicons" }}
  }
  -- Navigation
  use { "phaazon/hop.nvim" }
  use { "christoomey/vim-tmux-navigator" }

  -- Terminal
  use { "voldikss/vim-floaterm" }
end)

