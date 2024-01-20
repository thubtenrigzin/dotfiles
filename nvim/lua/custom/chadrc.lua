---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    overriden_modules = function(modules)
      table.insert(
        modules,
        9,
        (function()
          return (vim.g.codeium and "~ {...}" or "")
        end)()
      )
      table.insert(
        modules,
        10,
        (function()
          return (vim.g.copilot and "~ {C}" or "")
        end)()
      )
    end,
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

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
