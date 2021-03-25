return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use {"wbthomason/packer.nvim", opt = true}

  -- Color scheme
  use { "rakr/vim-one" }
  use { "vim-airline/vim-airline" }
  use { "vim-airline/vim-airline-themes" }

  -- Syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "jiangmiao/auto-pairs" }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }

  -- LSP and completion
  use { "neovim/nvim-lspconfig" }
  use { "nvim-lua/completion-nvim" }

  -- Git
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-dispatch" }
  use { "airblade/vim-gitgutter" }

  -- Drawer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }

  -- Surround
  use { "tpope/vim-surround" }

  -- Motion
  use { "phaazon/hop.nvim" }
  use { "christoomey/vim-tmux-navigator" }
  
  -- Emmet
  use { "mattn/emmet-vim" }

  -- Indentline
  use { "Yggdroot/indentLine" }

  -- Commenter
  use { "preservim/nerdcommenter" }
end)
