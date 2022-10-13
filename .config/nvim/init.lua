-- Packer bootstrap & plugins
require("plugins")

-- General settings
pcall(require("settings"))

-- Plugin-specific settings
pcall(require("plugin"))

-- Keybinds
require("keybinds")

-- LSP Config
pcall(require("lsp"))
