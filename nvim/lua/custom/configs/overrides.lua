local WIDTH_RATIO = 0.3
local HEIGHT_RATIO = 0.5

local M = {}

M.cmp = {
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = 'nvim_lsp_document_symbol' },
    { name = "nvim_lsp_signature_help" },
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
    "gopls",

    -- python
    "pyright",

    -- DAP
    "delve",
    "cpptools",
    "debugpy",
    "node-debug2-adapter",
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

  rainbow = {
    enable = true,
    --extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --max_file_lines = nil,
    --query = {
    --  "rainbow-parens",
    --  html = "rainbow-tags",
    --},
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  }
}

return M
