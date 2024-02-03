local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  --
  -- Override plugins configuration
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-emoji",
      "f3fora/cmp-spell",
      "ray-x/cmp-treesitter",

      { "zbirenbaum/copilot-cmp", config = true },
    },
    opts = overrides.cmp,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  { "NvChad/nvim-colorizer.lua", opts = overrides.colorizer },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "glepnir//lspsaga.nvim",
        config = function()
          require "custom.configs.lspsaga"
        end,
      },

      {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = function()
          dofile(vim.g.base46_cache .. "git")
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

  {
    "L3MON4D3/LuaSnip",
    opts = overrides.luasnip,
    config = function()
      require("luasnip").filetype_extend("vue", { "html" })
    end,
  },

  { "williamboman/mason.nvim", opts = overrides.mason },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  { "NvChad/nvterm", opts = overrides.nvterm },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "danymat/neogen",
        config = function()
          require "custom.configs.neogen"
        end,
      },

      "windwp/nvim-ts-autotag",

      { "hiphish/rainbow-delimiters.nvim", pin = true },

      {
        "andymass/vim-matchup",
        config = true,
        init = function()
          vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
      },
    },
    opts = overrides.treesitter,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      require("nvim-treesitter.install").compilers = { "clang" }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "tom-anders/telescope-vim-bookmarks.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-file-browser.nvim",

      {
        "debugloop/telescope-undo.nvim",
        config = function()
          require("telescope").load_extension "undo"
        end,
      },

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension "fzf"
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

  --
  -- Install plugins
  --
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
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
  },

  {
    "stevearc/conform.nvim",
    key = "<leader>lf",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  { "Exafunction/codeium.nvim", cmd = "Codeium", config = true },

  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        opts = {
          task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1,
          },
        },
      },
    },
  },

  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.dropbar"
    end,
  },

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
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = { { "tpope/vim-repeat" } },
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.mini"
    end,
  },

  -- code-minimap : https://github.com/wfxr/code-minimap
  { "wfxr/minimap.vim", event = "VeryLazy" },

  { "AckslD/muren.nvim", cmd = "MurenToggle", config = true },

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

  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "theHamsta/nvim-dap-virtual-text", config = true },
      },

      -- JS / TS
      { "mxsdev/nvim-dap-vscode-js", ft = { "javascript", "typescript" } },

      -- python
      {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        config = function()
          require("dap-python").setup(vim.fn.getcwd() .. "\\.virtualenvs\\debugpy\\Scripts\\python")
        end,
      },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },

  { "petertriho/nvim-scrollbar", event = "CursorMoved", config = true },

  { "kylechui/nvim-surround", event = "VeryLazy", config = true },

  {
    "nguyenvukhang/nvim-toggler",
    event = "VeryLazy",
    config = function()
      require "custom.configs.toggler"
    end,
  },

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

  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", config = true },

  { "folke/todo-comments.nvim", event = "VeryLazy", config = true },

  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },

  { "Pocco81/true-zen.nvim", event = "WinNew" },

  { "mbbill/undotree", cmd = "UndotreeToggle" },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  { "drzel/vim-gui-zoom", cmd = { "ZoomIn", "ZoomOut" } },

  {
    "MattesGroeger/vim-bookmarks",
    event = "VeryLazy",
    init = function()
      require "custom.configs.bookmarks"
    end,
  },
}

return plugins
