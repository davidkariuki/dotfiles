-- Follow the active Omarchy theme when it exists.
-- Catppuccin Mocha is the portable fallback (macOS / non-Omarchy machines).
local omarchy_theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

if vim.fn.filereadable(omarchy_theme) == 1 then
  local ok, spec = pcall(dofile, omarchy_theme)
  if ok and type(spec) == "table" then
    return spec
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "mocha" },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-mocha" },
  },
}
