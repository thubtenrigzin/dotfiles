--[[
TODO:
sidebar
lspsaga full setup in file
null-ls config file
telescope config and fzf & extensions_list
trouble config file
noice config file
devicon see override config
liveserver
hightlight for dapui: https://github.com/rcarriga/nvim-dap-ui/blob/master/lua/dapui/config/highlights.lua
typescript: https://github.com/marilari88/twoslash-queries.nvim & https://github.com/pmizio/typescript-tools.nvim

FIX:
matchup not working
cmp codeium
hlchunk highlight on dapui / noice
typescript dap: https://theosteiner.de/debugging-javascript-frameworks-in-neovim

BUG:
telescope fzf

NOTE:
command telescope not found
change path spellcheck
typescript.nvim vs typescript-tools
see test files programming
--]]

---@type NvPluginSpec[]

local overrides = require "custom.configs.overrides"

local plugins = {

  --------------------------- NvChad default plugins ---------------------------

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "f3fora/cmp-spell",
      "ray-x/cmp-treesitter",
    },
    opts = overrides.cmp,
  },

  { "NvChad/nvim-colorizer.lua", opts = overrides.colorizer },

  --{ "nvim-tree/nvim-web-devicons", opts = overrides.devicons },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },

      {
        "glepnir//lspsaga.nvim",
        config = function()
          require "custom.configs.lspsaga"
        end,
      },

      "b0o/SchemaStore.nvim", -- https://www.schemastore.org/json/

      {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        config = function()
          require "custom.configs.toggle-lsp-diag"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  { "L3MON4D3/LuaSnip",	opts = overrides.luasnip },

  { "williamboman/mason.nvim", opts = overrides.mason },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  { "NvChad/nvterm", opts = overrides.nvterm },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "hiphish/rainbow-delimiters.nvim",

      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require "custom.configs.comment"
        end
      },
    },
    opts = overrides.treesitter,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require "nvim-treesitter.configs".setup(opts)
      require('nvim-treesitter.install').compilers = { "clang" }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "tom-anders/telescope-vim-bookmarks.nvim",
      "nvim-telescope/telescope-dap.nvim",

      {
        "debugloop/telescope-undo.nvim",
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
	  
	  {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function()
        require("telescope").load_extension("fzf")
      end,
      },
    },
	opts = overrides.telescope,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      dofile(vim.g.base46_cache .. "whichkey")
      require "custom.configs.whichkey"
    end,
  },

  --------------------------- Other plugins ---------------------------

  {
    "MattesGroeger/vim-bookmarks",
    event = "VeryLazy",
    init = function()
      require "custom.configs.bookmarks"
    end,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      dofile(vim.g.base46_cache .. "git")
    end,
  },
  
  {
    "neoclide/coc.nvim",
	event = "VeryLazy",
    branch = "release",
	dependencies = {
	    "yaegassy/coc-volar",
	  {
	    "yaegassy/coc-volar-tools",
        build = "yarn install --frozen-lockfile",
	  },
	},
  },
  
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.codeium"
    end
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
  },

  --
  -- DAP
  --
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "theHamsta/nvim-dap-virtual-text", config = true },
      },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },
  -- Go
  --[[{
    "leoluz/nvim-dap-go",
    ft = "go",
    config = true
  },]]
  -- JS / TS
  { "mxsdev/nvim-dap-vscode-js", ft = { "javascript", "typescript" } },

  -- python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup(vim.fn.getcwd() .. '\\.virtualenvs\\debugpy\\Scripts\\python' )
    end,
  },
  
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.dropbar"
    end,
  },

  { "drzel/vim-gui-zoom", cmd = { "ZoomIn", "ZoomOut" } },

  { "ThePrimeagen/harpoon", cmd = "Harpoon" },

  {
    "shellRaining/hlchunk.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.hlchunk"
    end,
  },

  {
    "ziontee113/icon-picker.nvim",
    cmd = "IconPickerNormal",
    dependencies = "stevearc/dressing.nvim",
    config = function()
      require "custom.configs.iconpicker"
    end,
  },

  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },

  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.mini"
    end,
  },

  -- code-minimap : https://github.com/wfxr/code-minimap
  { "wfxr/minimap.vim", event = "VeryLazy" },

  {
    "AckslD/muren.nvim",
    cmd = "MurenToggle",
    config = true,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },

  {
    "jedrzejboczar/possession.nvim",
    cmd = { "PossessionSave", "PossessionClose", "PossessionDelete" },
    config = function()
      require "custom.configs.possession"
    end,
  },

  { "ThePrimeagen/refactoring.nvim", cmd = "Refactor", config = true },

  {
    "sidebar-nvim/sidebar.nvim",
    cmd = "SidebarNvimToggle",
    dependencies = "sidebar-nvim/sections-dap",
    config = function()
      require "custom.configs.sidebar"
    end,
  },

  { "petertriho/nvim-scrollbar", event = "CursorMoved", config = true },

  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", config = true },

  { "folke/todo-comments.nvim", event = "VeryLazy", config = true },

  {
    "nguyenvukhang/nvim-toggler",
    event = "VeryLazy",
    config = function()
      require "custom.configs.toggler"
    end,
  },

  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },

  { "Pocco81/true-zen.nvim", event = "WinNew" },

  -- Folds
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    keys = { "zf", "zo", "za", "zc", "zM", "zR" },
    dependencies = {
      "kevinhwang91/promise-async",

      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },

      {
        "anuvyklack/fold-preview.nvim",
        dependencies = "anuvyklack/keymap-amend.nvim",
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  
  {
    "pmizio/typescript-tools.nvim",
	ft = "typescript"
  },

  { "mbbill/undotree", cmd = "UndotreeToggle" },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
}

return plugins
