---@type ChadrcConfig
local M = {}

local highlights = require "highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "default",
    order = {
      "mode",
      "file",
      "autosave_status",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "codeium_status",
      "lsp",
      "copilot_status",
      "cwd",
      "cursor",
    },
    modules = {
      autosave_status = function()
        return "%#AutoSaveHl#" .. (vim.g.autosave and " 󰳼 " or " 󱙄 ")
      end,
      codeium_status = function()
        return "%#CodeiumHl#" .. (vim.g.codeium and "{󰇘}" or "{󰇘}")
      end,
      copilot_status = function()
        return "%#CopilotHl#" .. (vim.g.copilot and "  " or "  ")
      end,
    },
  },

  nvdash = {
    load_on_startup = false,

    header = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    },

    buttons = {
      { "  Find File", "<space>ff", "Telescope find_files" },
      { "󰈚  Recent Files", "<space>fo", "Telescope oldfiles" },
      { "󰈭  Find Word", "<space>fw", "Telescope live_grep" },
      { "  Bookmarks", "<space>fm", "Telescope marks" },
      { "  Sessions", "<space>fS", "Telescope possession list" },
      { "  Themes", "<space>ft", "Telescope themes" },
      { "  Mappings", "<space>fk", "NvCheatsheet" },
    },
  },
}

return M
