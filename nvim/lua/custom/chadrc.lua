local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "gruvbox_light" },

  lsp = { signature = { disabled = true} },

  statusline = {
    overriden_modules = function(modules)
      table.insert(
        modules,
        9,
        (function()
          return (vim.g.codeium and "~ 󰄭 {...}" or "")
        end)()
      )
    end,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,

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

M.lazy_nvim = {
  ui = {
    border = "solid",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
