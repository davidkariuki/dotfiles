return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use {"wbthomason/packer.nvim", opt = true}

  -- Color scheme
  use { "rakr/vim-one" }

  -- Syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

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
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }

  -- Misc
  use { "mhinz/vim-startify" }
  use { "mattn/emmet-vim" }
  use { "ap/vim-css-color" }
  use { "Yggdroot/indentLine" }
  use { "preservim/nerdcommenter" }
  use { "christoomey/vim-tmux-navigator" }
  use { "vim-airline/vim-airline" }
  use { "vim-airline/vim-airline-themes" }
  use { "jiangmiao/auto-pairs" }
end)
