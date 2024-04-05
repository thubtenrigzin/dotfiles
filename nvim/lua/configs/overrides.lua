local M = {}

M.cmp = {
  sources = {
    { name = "copilot" },
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "treesitter" },
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

M.gitsigns = {
  on_attach = function(bufnr) -- see configs.gitsigns.lua for the NvChad keymaps
    local gs = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set

    map("n", "[g", function()
      if vim.wo.diff then
        return "[g"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Gitsigns Jump to prev hunk" })

    map("n", "]g", function()
      if vim.wo.diff then
        return "]g"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Gitsigns Jump to next hunk" })

    map("n", "<leader>gd", function()
      require("gitsigns").toggle_deleted()
    end, { desc = "Gitsigns Toggle deleted" })

    map("n", "<leader>gr", gs.reset_hunk, opts "Reset Hunk")
    map("n", "<leader>gp", gs.preview_hunk, opts "Preview Hunk")
    map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
  end,
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "emmet-ls",
    "html-lsp",
    "json-lsp",
    "prettier",
    "typescript-language-server",
    "vue-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    --"cpptools",

    -- python
    "black",
    "debugpy",
    "isort",
    "pylint",
    "pyright",
    "ruff",

    --"node-debug2-adapter",
    --"js-debug-adapter"5jkkkjj
  },
}

M.nvimtree = {
  renderer = {
    root_folder_label = true,
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

M.treesitter = {
  autotag = { enable = true },

  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "html",
    "htmldjango",
    "http",
    "javascript",
    "json",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "regex",
    "scss",
    "sql",
    "typescript",
    "vue",
  },

  matchup = { enable = true },
}

return M
