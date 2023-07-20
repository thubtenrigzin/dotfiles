--[[
TODO:
nvim-code-action-menu <- colors + config file

dap-go should not load if c or js...
matchup not working
lspsaga full setup in file
ZEN <- event vimEnter vs BufWinEnter
null-ls config
telescope
blankline config
trouble config
cmp + codium + tabnine

NOTE:
vim-surround ou mini-surround
config auto-save

command telescope not found
change path spellcheck
typescript.nvim vs typescript-tools
--]]

---@type NvPluginSpec[]

local overrides = require "custom.configs.overrides"

local plugins = {

  --------------------------- NvChad default plugins ---------------------------

  --{ "lukas-reineke/indent-blankline.nvim", opts = overrides.blankline },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "f3fora/cmp-spell" },
    opts = overrides.cmp,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
	  {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
		config = function()
          dofile(vim.g.base46_cache .. "git")
        end,
      },
	
      -- lsp Saga
      {
        "glepnir//lspsaga.nvim",
        config = true
        --config = function()
          --require("lspsaga").setup({})
          --require "custom.configs.lspsaga"
        --end
      },

      {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        config = function()
          require'toggle_lsp_diagnostics'.init({
            underline = false,
            virtual_text = false,
          })
        end,
      },

      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },

      -- Schemas store
      -- https://www.schemastore.org/json/
      {
        "b0o/SchemaStore.nvim",
        config = function()
          require "custom.configs.providers"
        end,
      },

      { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", config = true },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  { "williamboman/mason.nvim", opts = overrides.mason },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  { "NvChad/nvterm", opts = overrides.nvterm },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "HiPhish/nvim-ts-rainbow2",
    },
    opts = overrides.treesitter,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require "nvim-treesitter.configs".setup(opts)
      require('nvim-treesitter.install').compilers = { "clang" }
    end,
  },

  --{ "nvim-telescope/telescope.nvim", opts = overrides.telescope },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      require "custom.configs.whichkey"
    end,
  },

  --------------------------- Other plugins ---------------------------

  {
    "Pocco81/auto-save.nvim",
    cmd = "ASToggle",
    config = function()
      require("auto-save").setup {
        enabled = false
      }
    end,
  },

  {
    "MattesGroeger/vim-bookmarks",
	event = "VeryLazy",
	init = function()
	  require "custom.configs.bookmarks"
	end,
  },

  -- code-minimap : https://github.com/wfxr/code-minimap
  { "wfxr/minimap.vim", event = "VeryLazy" },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "theHamsta/nvim-dap-virtual-text", config = true },
      },

      -- python
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require("dap-python").setup(vim.fn.getcwd() .. '\\.virtualenvs\\debugpy\\Scripts\\python' )
        end,
      },

      -- Go
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = true
      },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },

  { "ThePrimeagen/harpoon", cmd = "Harpoon" },

  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup {
        mappings = {
          "<C-u>",
          "<C-d>",
        }
      }
    end,
  },

  { "petertriho/nvim-scrollbar", event = "CursorMoved", config = true },

  -- Folds
  {
    "kevinhwang91/nvim-ufo",
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
        dependencies = { "anuvyklack/keymap-amend.nvim" },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    event = "BufReadPost",
    keys = { "zf", "zo", "za", "zc", "zM", "zR" },
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      }
    end,
  },

  {
    "jedrzejboczar/possession.nvim",
    cmd = { "PossessionSave", "PossessionClose", "PossessionDelete", "Telescope" },
    config = function()
      require "custom.configs.possession"
    end,
  },

  { "folke/todo-comments.nvim", event = "VeryLazy", config = true },

  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },

  { "Pocco81/true-zen.nvim", event = "WinEnter" },

  { "mbbill/undotree", event = "VeryLazy", cmd = "UndotreeToggle" },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  { "drzel/vim-gui-zoom", cmd = { "ZoomIn", "ZoomOut" } },

  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.illuminate"
    end,
  },

  { "tpope/vim-surround", event = "VeryLazy" },
}

return plugins
