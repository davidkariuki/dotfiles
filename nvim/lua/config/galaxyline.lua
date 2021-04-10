local gl = require("galaxyline")
local cond = require("galaxyline.condition")
local gls = gl.section

gl.short_line_list = {}

local colors = {
  bg = "#282c34",
  line_bg = "#282c34",
  fg = "#D8DEE9",
  fg_green = "#65a380",
  yellow = "#A3BE8C",
  cyan = "#22262C",
  darkblue = "#61afef",
  green = "#BBE67E",
  orange = "#FF8800",
  purple = "#d19a66",
  magenta = "#c678dd",
  blue = "#22262C",
  red = "#DF8890",
  lightbg = "#3C4048",
  nord = "#abb2bf",
  greenYel = "#EBCB8B"
}

local function left_arrow() return "" end
local function right_arrow() return "" end

gls.left[1] = {
  statusIcon = {
    provider = function() return "   " end,
    highlight = {colors.bg, colors.nord},
    separator = " ",
    separator_highlight = {colors.lightbg, colors.lightbg}
  }
}

gls.left[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = cond.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.lightbg}
  }
}

gls.left[3] = {
  FileName = {
    provider = {"FileName"},
    condition = cond.buffer_not_empty,
    highlight = {colors.fg, colors.lightbg}
  }
}

gls.left[4] = {
  RightArrow = {
    provider = right_arrow,
    separator = " ",
    highlight = {colors.lightbg, colors.bg}
  }
}

gls.left[5] = {
  DiffAdd = {
    provider = "DiffAdd",
    icon = "  ",
    highlight = {colors.green, colors.line_bg}
  }
}

gls.left[6] = {
  DiffModified = {
    provider = "DiffModified",
    icon = "  ",
    highlight = {colors.darkblue, colors.line_bg}
  }
}

gls.left[7] = {
  DiffRemove = {
    provider = "DiffRemove",
    icon = "  ",
    highlight = {colors.red, colors.line_bg}
  }
}

gls.left[8] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = {colors.line_bg, colors.line_bg},
    highlight = {colors.line_bg, colors.line_bg}
  }
}

gls.left[9] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.bg}
  }
}

gls.left[10] = {
  Space = {
    provider = function()
      return " "
    end,
    highlight = {colors.line_bg, colors.line_bg}
  }
}

gls.left[11] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.orange, colors.bg}
  }
}

gls.right[1] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = cond.hide_in_width or cond.check_git_workspace,
    highlight = {colors.green, colors.line_bg}
  }
}

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = cond.hide_in_width or cond.check_git_workspace,
    highlight = {colors.green, colors.line_bg},
  }
}

gls.right[3] = {
  LeftArrow = {
    provider = left_arrow,
    separator = " ",
    separator_highlight = {colors.bg, colors.bg},
    highlight = {colors.nord, colors.bg},
    condition = cond.hide_in_width
  }
}

gls.right[4] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        p = "PASTE",
        R = "REPLACE"
      }
      return alias[vim.fn.mode()]
    end,
    highlight = {colors.bg, colors.nord},
    condition = cond.hide_in_width
  }
}

gls.right[5] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = {colors.nord, colors.nord},
    highlight = {colors.bg, colors.fg},
    condition = cond.hide_in_width
  }
}

