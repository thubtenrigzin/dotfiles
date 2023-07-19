local M = {}

M.cmp = {  
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
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
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    --"lua-language-server",
    --"stylua",
	
	-- web dev stuff
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "typescript-language-server",
    --"vue-language-server",
	
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
    side = "left",
    width = 30,
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
  
  matchup = {
    enable = true,
    disable = { "" }
  },
  
  autotag = { enable = true },
  
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