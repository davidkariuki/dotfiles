return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim", opt = true }

  -- Syntax / Linting
  use { "rakr/vim-one" }
  use { "hoob3rt/lualine.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "p00f/nvim-ts-rainbow" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "jiangmiao/auto-pairs" }
  use { "preservim/nerdcommenter" }
  use { "Yggdroot/indentLine" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "mattn/emmet-vim" }
  use { "tpope/vim-surround" }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use { "kevinhwang91/nvim-bqf" }

  -- LSP and completion
  use { "neovim/nvim-lspconfig" }
  use { "kabouzeid/nvim-lspinstall" }
  use { "hrsh7th/nvim-compe" }
  use { "onsails/lspkind-nvim" }


  -- Git
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-dispatch" }
  use { "airblade/vim-gitgutter" }

  -- Drawer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }
  -- Navigation
  use { "phaazon/hop.nvim" }
  use { "christoomey/vim-tmux-navigator" }
end)

