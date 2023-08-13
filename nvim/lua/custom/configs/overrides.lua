local WIDTH_RATIO = 0.3
local HEIGHT_RATIO = 0.5

local M = {}

M.cmp = {
  sources = {
    { name = "luasnip" },
    { name = 'treesitter' },
    { name = "nvim_lsp" },
    { name = 'nvim_lsp_document_symbol' },
    { name = "buffer", keyword_length = 3 },
    { name = "nvim_lua" },
    { name = "path" },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      },
    },
    { name = 'emoji' },
  },
}

M.colorizer = {
  user_default_options = {
    names = false,
  },
}

--[[M.devicons = {
  override_by_filename = {
    ["makefile"] = {
      icon = "",
      color = "#f1502f",
      name = "Makefile",
    },
    ["mod"] = {
      icon = "󰟓",
      color = "#519aba",
      name = "Mod",
    },
    ["sum"] = {
      icon = "󰟓",
      color = "#cbcb40",
      cterm_color = "185",
      name = "Sum",
    },
    [".gitignore"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "196",
      name = "GitIgnore",
    },
    ["js"] = {
      icon = "",
      color = "#cbcb41",
      cterm_color = "185",
      name = "Js",
    },
    ["lock"] = {
      icon = "",
      color = "#bbbbbb",
      cterm_color = "250",
      name = "Lock",
    },
    ["package.json"] = {
      icon = "",
      color = "#e8274b",
      name = "PackageJson",
    },
    [".eslintignore"] = {
      icon = "󰱺",
      color = "#e8274b",
      name = "EslintIgnore",
    },
    ["tags"] = {
      icon = "",
      color = "#bbbbbb",
      cterm_color = "250",
      name = "Tags",
    },
    ["http"] = {
      icon = "󰖟",
      color = "#519aba",
      name = "Http",
    },
  },
}--]]

M.luasnip = {
  require("luasnip.loaders.from_vscode").load({ paths = { vim.fn.stdpath "config" .. "\\lua\\custom\\snippets" } })
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    --"stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "typescript-language-server",
    "vue-language-server",

    -- Formating
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",

    "clang-format",

    -- Go
    --"gopls",

    -- python
    "pyright",

    -- DAP
    --"delve",
    "cpptools",
    "debugpy",
    --"node-debug2-adapter",
    "js-debug-adapter"
  },
}

M.nvimtree = {
  view = {
    --side = "left",
    --width = 30,

    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },

    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },

  git = { enable = true },

  renderer = {
    root_folder_label = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "leftabove", split_ratio = 0.5 },
    },
  }
}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

M.treesitter = {
  ensure_installed = {
    --"bash",
    "c",
    --"cpp",
    --"css",
    --"dockerfile",
    "html",
    --"http",
    --"javascript",
    --"json",
    "markdown",
    "markdown_inline",
    --"php",
    --"python",
    --"regex",
    --"typescript",
    --"scss",
    --"sql",
    --"vim",
    --"vue",
  },

  autotag = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

return M
