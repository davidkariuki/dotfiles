vim.g.mapleader = " "

local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto-install Packer
local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
end
vim.cmd [[packadd packer.nvim]]

-- Auto-compile plugin changes
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

-- Install plugins
 require("plugins")

-- Plugin Config
 require("config")

-- Keybinds
require("keybinds")

-- General settings
require("settings")

