local hl = vim.api.nvim_set_hl

hl(0, "CmpItemAbbrDeprecated", { strikethrough = true, fg = "#808080" })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })
hl(0, "CmpItemMenu", { link = "CmpItemKind", italic = true })
