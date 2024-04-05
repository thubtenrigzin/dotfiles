local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true },
  ["@comment"] = { italic = true },
}

---@type HLTable
M.add = {
  AutoSaveHl = { fg = "red" },
  CodeiumHl = { fg = "green" },
  CopilotHl = { fg = "green" },
}

return M
