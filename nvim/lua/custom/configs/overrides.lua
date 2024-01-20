local M = {}

M.cmp = {
  sources = {
    { name = "copilot" },
    { name = "codeium" },
    { name = "nvim_lsp", trigger_characters = { "-" } },
    { name = "luasnip" },
    { name = "treesitter" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_document_symbol" },
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
    { name = "emoji" },
  },

  experimental = {
    ghost_text = true,
  },
}

M.colorizer = {
  user_default_options = {
    names = false,
  },
}

M.luasnip = {
  require("luasnip.loaders.from_vscode").load { paths = { vim.fn.stdpath "config" .. "\\lua\\custom\\snippets" } },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    --"stylua",

    -- web dev stuff
    "css-lsp",
    "emmet-ls",
    "html-lsp",
    "json-lsp",
    "typescript-language-server",
    "vue-language-server",

    -- Formating
    --"deno",
    --"prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",

    -- DAP
    --"cpptools",
    "debugpy",
    --"node-debug2-adapter",
    --"js-debug-adapter"
  },
}

M.nvimtree = {
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

  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * 0.5 -- width constant
        local window_h = screen_h * 0.5 -- heigth constant
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
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "leftabove", split_ratio = 0.5 },
    },
  },
}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

M.treesitter = {
  autotag = { enable = true },

  ensure_installed = {
    --"bash",
    --"c",
    --"cpp",
    --"dockerfile",
    "html",
    --"http",
    "css",
    "javascript",
    "json",
    "markdown",
    "markdown_inline",
    --"php",
    "python",
    "regex",
    "scss",
    --"sql",
    "typescript",
    "vue",
  },

  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  
  matchup = { enable = true },
}

return M
