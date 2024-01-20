---@type MappingsTable
local M = {}

--
-- disabled keys
--
M.disabled = {
  n = {
    -- blankline
    ["<leader>cc"] = {},

    -- bookmark
    ["<leader>b"] = {},

    -- cheatsheet
    ["<leader>ch"] = {},

    -- comment
    ["<leader>/"] = {},

    -- Git
    ["[c"] = {},
    ["]c"] = {},
    ["<leader>rh"] = {},
    ["<leader>ph"] = {},
    ["<leader>td"] = {},

    -- line numbers
    ["<leader>n"] = {},
    ["<leader>rn"] = {},

    -- LSP stuffs
    ["gD"] = {},
    ["gd"] = {},
    ["gi"] = {},
    ["gr"] = {},
    ["<leader>ca"] = {},
    ["<leader>D"] = {},
    ["<leader>ra"] = {},
    ["<leader>wa"] = {},
    ["<leader>wr"] = {},
    ["<leader>wl"] = {},
    ["[d"] = {},
    ["]d"] = {},

    -- nvimtree
    ["<C-n>"] = {},
    ["<leader>e"] = {},

    -- nvterm
    ["<A-i>"] = {},
    ["<A-v>"] = {},
    ["<A-h>"] = {},
    ["<leader>h"] = {},
    ["<leader>v"] = {},

    -- tabufline
    ["<leader>x"] = {},
    ["<tab>"] = {},
    ["<S-tab>"] = {},

    -- telescope
    ["<leader>gt"] = {},
    ["<leader>cm"] = {},
    ["<leader>pt"] = {},
    ["<leader>th"] = {},
    ["<leader>ma"] = {},
  },

  v = {
    -- comment
    ["<leader>/"] = {},
  },

  t = {
    -- nvterm
    ["<A-i>"] = {},
    ["<A-v>"] = {},
    ["<A-h>"] = {},
  },
}

--
-- general keys
--
M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },

    -- Work with numbers
    ["<A-+>"] = { "<C-a>", "Increment the number" },
    ["<A-->"] = { "<C-x>", "Decrement the number" },

    -- Selection
    ["<C-a>"] = { "gg0vG$", "Select all" },
    ["<C-S-v>"] = { "<C-v>", "Block Visual mode" },

    -- Super clipboard
    ["<C-S-c>"] = {
      '"+y$:let @"=@0<cr>',
      opts = { silent = true },
      "Copy to the end of the line to the system clipboard",
    },
    ["<C-c>"] = { '"+yy:let @"=@0<cr>', opts = { silent = true }, "Copy the line to the system clipboard" },
    ["<C-S-x>"] = {
      '"+y$:let @"=@0<cr>"_d$',
      opts = { silent = true },
      "Cut to the end of the line to the system clipboard",
    },
    ["<C-x>"] = { '"+yy:let @"=@0<cr>"_dd', opts = { silent = true }, "Cut the line to the system clipboard" },
    ["<C-v>"] = { '"*p', "", "Paste from the system clipboard" },

    -- No yanking
    ["<A-d>"] = { '"_d', "Delete without yanking" },
    ["<A-x>"] = { '"_x', "Delete without yanking" },

    -- other cmds
    ["<leader>pc"] = { "<cmd> checkhealth <CR>", "Check the health of Neovim" },

    -- Inspect code
    ["<S-h>k"] = { "<cmd> Inspect <CR>", "Hightlight the group under the cursor" },
    ["<S-h>l"] = { "<cmd> InspectTree <CR>", "Hightlight the group under the cursor" },

    -- wrapping & autoformat
    ["<A-F11>"] = { "<cmd> TextWidthToggle <CR>", "toggle the textWidth option" },
    ["<F11>"] = { "mzgg0gqG`z <cmd> set fo+=a <CR>", "toggle the characters wrapping" },

    ["<C-F12>"] = { "<cmd> set list! <CR>", "toggle hidden characters" },
  },

  i = {
    -- Super clipboard
    ["<C-v>"] = { '<Esc>"*pi', "Paste after from the system clipboard" },
  },

  v = {
    -- Move lines
    ["<a-k>"] = { ":m '<-2<CR>gv=gv", opts = { silent = true }, "Slide up" },
    ["<a-j>"] = { ":m '>+1<CR>gv=gv", opts = { silent = true }, "Slide down" },

    -- Super double clipboard
    ["<C-c>"] = { '"+y:let @"=@0<cr>', opts = { silent = true }, "Copy to the system clipboard" },
    ["<C-x>"] = { '"+y:let @"=@0<cr><Esc>gv"_d', opts = { silent = true }, "Cut to the system clipboard" },
    ["<C-v>"] = { '"_d"*P', "Paste from system clipboard" },

    -- No yanking
    ["<A-d>"] = { '"_d', "Delete without yanking" },
    ["<A-x>"] = { '"_x', "Delete without yanking" },
  },

  c = {
    -- Super double clipboard
    ["<A-p>"] = { '<C-r>"', "Paste to the command line" },
    ["<C-v>"] = { "<C-r>*", "Paste from the system clipboard to the command line" },
  },
}

M.comment = {
  plugin = true,
  n = {
    ["<leader>;"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>;"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.spellcheck = {
  n = {
    ["<A-F12>"] = { "<cmd> set spell! <CR>", "Toggle Spell checking" },
  },
}

--
-- NvChad default plugin keys
--
M.blankline = {
  n = {
    ["<leader>lc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,
      "Jump to current_context",
    },
  },
}

M.gitsigns = {
  n = {
    -- Navigation through hunks
    ["[g"] = {
      function()
        if vim.wo.diff then
          return "[g"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[G"] = {
      function()
        if vim.wo.diff then
          return "[G"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "display the hunks preview window",
    },

    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.Lazy = {
  n = {
    ["<leader>ps"] = { "<cmd> Lazy sync <CR>", "Packager sync" },
    ["<leader>pp"] = { "<cmd> Lazy <CR>", "Packager Profile" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>lf"] = {
      function()
        require("conform").format()
      end,
      "Format code",
    },

    ["<leader>lD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["<leader>lWa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>lWr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>lWl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.togglelspdiagunderline = {
  n = {
    ["<F12>"] = { "<Plug>(toggle-lsp-diag-underline) <Plug>(toggle-lsp-diag-vtext) <Esc>hh", "Toggle the diagnostics" },
  },
}

M.nvdash = {
  n = {
    ["<C-Home>"] = { "<Cmd> Nvdash <CR>", "Launch the dashboard" },
  },
}
M.nvimtree = {
  n = {
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.nvterm = {
  n = {
    ["<F4>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Open term in the center",
    },

    ["<F5>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Open down below term",
    },

    ["<F3>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Open left side term",
    },
  },

  t = {
    ["<F4>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Close floating term",
    },

    ["<F5>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Close down below term",
    },

    ["<F3>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Close left side term",
    },
  },
}

M.tabufline = {
  n = {
    ["<C-S-Tab>"] = { "<cmd> enew <CR>", "Create a new buffer" },

    ["[<Tab>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Go to next buffer",
    },

    ["[<S-tab>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>q"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close the current buffer",
    },

    ["<leader><C-S-Tab>"] = { "<cmd> tabnew <CR>", "Create a new tab" },
    ["<leader>Q"] = { "<cmd> tabclose <CR>", "Close the tab" },
  },
}

M.telescope = {
  n = {
    -- bookmarks
    ["<leader>fb"] = { "<cmd> Telescope vim_bookmarks all <CR>", "Find bookmarks" },

    -- buffers
    ["<leader>fB"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },

    -- dap
    ["<leader>fdc"] = { "<cmd> Telescope dap commands <CR>", "Find dap commands" },
    ["<leader>fdC"] = { "<cmd> Telescope dap configuration <CR>", "Find dap configuration" },
    ["<leader>fdb"] = { "<cmd> Telescope dap list_breakpoints <CR>", "Find dap breakpoints" },
    ["<leader>fdv"] = { "<cmd> Telescope dap variables <CR>", "Find dap variables" },
    ["<leader>fdf"] = { "<cmd> Telescope dap frames <CR>", "Find dap frames" },

    -- Git
    ["<leader>fg"] = { '<cmd> lua require("telescope").extensions.lazygit.lazygit() <CR>', "Find Git repos" },

    -- Marks
    ["<leader>fm"] = { "<Cmd> Telescope marks <CR>", "Find marks" },

    -- Possession
    ["<leader>fS"] = { "<Cmd> Telescope Possession list <CR>", "List all the sessions" },

    -- Lsp stuffs
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find Symbols" },

    ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "Find lsp References" },
    ["<leader>fi"] = { "<cmd> Telescope lsp_implementations <CR>", "Find lsp implementations" },

    -- pick a hidden term
    ["<leader>fT"] = { "<cmd> Telescope terms <CR>", "Pick an hidden term" },

    -- pick a NvChad theme
    ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "NvChad themes" },

    -- undo
    ["<leader>fu"] = { "<cmd> Telescope undo <CR>", "Find in undo tree" },
  },
}

M.whichkey = { n = { ["<leader>fk"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" } } }

--
-- Other plugins
--
M.autosave = { n = { ["<leader>as"] = { "<cmd> AutosaveToggle <CR>", "Toggle AutoSave" } } }

M.bookmark = {
  n = {
    ["<leader>bj"] = { "<cmd> BookmarkToggle <CR>", "Add bookmark" },
    ["<leader>bi"] = { "<cmd> BookmarkAnnotate <CR>", "Annotate bookmark" },
    ["<leader>bl"] = { "<cmd> BookmarkNext <CR>", "Next bookmark" },
    ["<leader>bh"] = { "<cmd> BookmarkPrev <CR>", "Prev bookmark" },
    ["<leader>bk"] = { "<cmd> BookmarkClear <CR>", "Clear bookmarks" },
    ["<leader>bo"] = { "<cmd> BookmarkShowAll <CR>", "Show bookmarks" },
    ["<leader>bmk"] = { "<cmd> BookmarkMoveUp <CR>", "Move bookmark up" },
    ["<leader>bmj"] = { "<cmd> BookmarkMoveDown <CR>", "Move bookmark down" },
    ["<leader>bml"] = { "<cmd> BookmarkMoveToLine <CR>", "Move bookmark to line" },
  },
}

M.coc = {
  n = {
    ["<leader>vs"] = { "<cmd> CocCommand volar.action.splitEditors <CR>", "Split Vue file in 3 windows" },
  },
}

M.codeaction = { n = { ["<leader>la"] = { "<cmd> CodeActionMenu <CR>", "LSP code action" } } }

M.codeium = {
  n = {
    ["<leader>cm"] = { "<cmd> CodeiumOn <CR>", "Start Codeium" },
  },
}

M.copilot = {
  n = {
    ["<leader>cp"] = { "<cmd> CopilotToggle <CR>", "Toggle Copilot" },
  },
}

M.compiler = {
  n = {
    ["<C-F4>"] = { "<cmd> CompilerOpen <CR>", "Open the compiler" },
  },
}

M.dap = {
  n = {
    ["<F6>"] = {
      function()
        require("dap").continue()
      end,
      "Start debugging",
    },
    ["<F8>"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<F7>"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    ["<F8>"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },
    ["<F9>"] = {
      function()
        require("dap").step_back()
      end,
      "Step back",
    },
    ["<A-F6>"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to cursor",
    },
    ["<F10>"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint",
    },
    ["<C-A>F10"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear all the breakpoints",
    },
    ["<A-F10>"] = {
      function()
        require("dap").list_breakpoints()
        vim.cmd "TroubleToggle quickfix"
      end,
      "Open all the breakpoints in the Quicklist",
    },
    ["<C-F10>"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Set breakpoint",
    },
    ["<leader>F10"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end,
      "Set breakpoint / message",
    },
    ["<leader>F6"] = {
      function()
        require("dap").repl.open()
      end,
      "Replace open",
    },
    ["<C-A>F6"] = {
      function()
        require("dap").run_last()
      end,
      "Run last",
    },
    ["<C-F6>"] = {
      function()
        require("dap").terminate()
        require("dap").clear_breakpoints()
        require("dap").close()
        require("dapui").close()
      end,
      "Terminate",
    },
  },
}

M.dropbar = {
  n = {
    ["<A-k>"] = {
      function()
        require("dropbar.api").pick()
      end,
      "Navigate into the dropbar menu",
    },
  },
}

M.guizoom = {
  n = {
    ["+"] = { "<cmd> ZoomIn <CR>", "Zoom in" },
    ["-"] = { "<cmd> ZoomOut <CR>", "Zoom out" },
    ["<C-ScrollWheelUp>"] = { "<cmd> ZoomIn <CR>", "Zoom in" },
    ["<C-ScrollWheelDown>"] = { "<cmd> ZoomOut <CR>", "Zoom out" },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon Add file",
    },

    ["<leader>hm"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon Menu",
    },
    ["<leader>hj"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Navigate to file 1",
    },
    ["<leader>hk"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Navigate to file 2",
    },
    ["<leader>hl"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Navigate to file 3",
    },
    ["<leader>hh"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Navigate to file 4",
    },
  },
}

M.iconpicker = {
  n = {
    ["<leader>:"] = { "<cmd> IconPickerNormal <CR>", "Pick an icon" },
  },
}

M.lazygit = { n = { ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Lazygit" } } }

M.lspsaga = {
  n = {
    ["<leader>ld"] = { "<cmd> Lspsaga goto_definition <CR>", "LSP Definition" },
    ["<leader>lwd"] = { "<cmd> Lspsaga peek_definition <CR>", "LSP preview definition" },

    ["<leader>lt"] = { "<cmd> Lspsaga goto_type_definition <CR>", "LSP Definition" },
    ["<leader>lwt"] = { "<cmd> Lspsaga peek_type_definition <CR>", "LSP preview type definition" },

    ["<F2>"] = { "<cmd> Lspsaga rename <CR>", "LSP rename" },

    ["K"] = { "<cmd> Lspsaga hover_doc <CR>", "Hover documentation" },

    ["[<S-x>"] = { "<cmd> Lspsaga diagnostic_jump_prev <CR>", "LSP previous diagnostic" },
    ["[x"] = { "<cmd> Lspsaga diagnostic_jump_next <CR>", "LSP next diagnostic" },
    ["<leader>lxj"] = { "<cmd> Lspsaga show_line_diagnostics <CR>", "LSP line diagnostic" },
    ["<leader>lxk"] = { "<cmd> Lspsaga show_cursor_diagnostics <CR>", "LSP cursor diagnostic" },
  },
}

M.minimap = { n = { ["<leader>mm"] = { "<Cmd> MinimapToggle <CR>", "Toggle the minimap window" } } }

M.muren = { n = { ["<A-F2>"] = { "<cmd> MurenToggle <CR>", "Toggle the search window" } } }

M.possession = {
  n = {
    ["<leader>ss"] = { ":PossessionSave ", "Save the session as..." },
    ["<leader>sc"] = { "<Cmd> PossessionClose <CR>", "Close the current session" },
    ["<leader>sd"] = { "<Cmd> PossessionDelete <CR>", "Delete the current session" },
  },
}

M.refactoring = {
  n = {
    ["<leader>ri"] = { "<cmd> Refactor inline_var <CR>", "Refactor Inline Var" },
    ["<leader>rb"] = { "<cmd> Refactor extract_block <CR>", "Refactor Extract Block" },
    ["<leader>rB"] = { "<cmd> Refactor extract_block_to_file <CR>", "Refactor Extract Block to File" },

    ["<leader>rj"] = {
      function()
        require("refactoring").select_refactor()
      end,
      "Prompt Refactor",
    },
  },

  v = {
    ["<leader>re"] = { "<cmd> Refactor extract <CR>", "Refactor extract" },
    ["<leader>rE"] = { "<cmd> Refactor extract_to_file <CR>", "Refactor Extract to File" },
    ["<leader>rv"] = { "<cmd> Refactor extract_var <CR>", "Refactor Extract Var" },

    ["<leader>ri"] = { "<cmd> Refactor inline_var <CR>", "Refactor Inline Var" },

    ["<leader>rj"] = {
      function()
        require("refactoring").select_refactor()
      end,
      "Prompt Refactor",
    },
  },
}

M.sidebar = { n = { ["<leader>ms"] = { "<cmd> SidebarNvimToggle <CR>", "Toggle the sidebar" } } }

M.symbolsoutline = { n = { ["<leader>ms"] = { "<cmd> SymbolsOutline <CR>", "Toggle Map Symbols tree" } } }

M.toggler = {
  n = {
    ["<leader>\\"] = {
      function()
        require("nvim-toggler").toggle()
      end,
      "Invert values",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>lr"] = { "<cmd> TroubleToggle lsp_references <CR>", "LSP References" },
    ["<leader>li"] = { "<cmd> TroubleToggle lsp_implementations <CR>", "LSP Implementation" },

    ["<leader>ll"] = { "<cmd> TroubleToggle loclist <CR>", "Loclist" },
    ["<leader>lq"] = { "<cmd> TroubleToggle quickfix <CR>", "Quickfix list" },

    ["<leader>lWx"] = { "<cmd> TroubleToggle workspace_diagnostics <CR>", "LSP Workspace Diagnostics" },
    ["<leader>lxx"] = { "<cmd> TroubleToggle document_diagnostics <CR>", "LSP Document Diagnostics" },
  },
}

M.truezen = { n = { ["<leader>z"] = { "<Cmd> TZFocus <CR>", "Maximize the current window" } } }

M.undotree = { n = { ["<C-z>"] = { "<cmd> UndotreeToggle <CR>", "Toggle UndoTree" } } }

return M
