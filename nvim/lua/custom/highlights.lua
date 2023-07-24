-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Normal = {
    bg = { "black", 4},
  },
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {}

return M
