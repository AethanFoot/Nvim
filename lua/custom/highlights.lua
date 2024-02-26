-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  St_file_info = {
    bg = "black",
    fg = "white",
  },

  St_file_sep = {
    bg = "statusline_bg",
    fg = "lightbg",
  },

  St_gitIcons = {
    fg = "white",
    bg = "black",
    bold = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
