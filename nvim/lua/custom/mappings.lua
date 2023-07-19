--[[
TODO:

NOTE:
space space
Toggle folds view

--]]

---@type MappingsTable
local M = {}

----------------------------- disabled keys -----------------------------

M.disabled = {
  n = {                                                          -- Normal Mode
    --
    -- General
    --

    -- comment
    ["<leader>/"] = { "" },

    -- cut stuffs
    ["<C-x>"] = { "" },

    -- line numbers
    ["<leader>n"] = { "" },
    ["<leader>rn"] = { "" },

    --
    -- NvChad default plugins keys
    --

    -- blankline
    ["<leader>cc"] = { "" },
	
	-- Git
	["[c"] = { "" },
	["]c"] = { "" },
	["<leader>rh"] = { "" },
	["<leader>ph"] = { "" },
	["<leader>gb"] = { "" },
	["<leader>td"] = { "" },
	

    -- nvimtree
    ["<C-n>"] = { "" },
    ["<leader>e"] = { "" },

    -- nvterm
    ["<A-i>"] = { "" },
    ["<A-v>"] = { "" },
    ["<A-h>"] = { "" },
    ["<leader>h"] = { "" },
    ["<leader>v"] = { "" },

    -- tabufline
    ["<leader>x"] = { "" },
	["<tab>"] = { "" },

    -- telescope
    ["<leader>gt"] = { "" },
    ["<leader>cm"] = { "" },
    ["<leader>pt"] = { "" },
    ["<leader>th"] = { "" },
    ["<leader>ma"] = { "" },

    --
    -- other plugins keys
    --

    ["<C-s>"] = { "" },
	["<leader>b"] = { "" },
	["<leader>ch"] = { "" },
	

    -- LSP stuffs
    ["gD"] = { "" },
    ["gd"] = { "" },
	["gi"] = { "" },
	["gr"] = { "" },
    ["<leader>ca"] = { "" },
    ["<leader>D"] = { "" },
    ["<leader>ra"] = { "" },
    ["<leader>wa"] = { "" },
    ["<leader>wr"] = { "" },
    ["<leader>wl"] = { "" },
	["<leader>f"] = { "" },
	["[d"] = { "" },
	["]d"] = { "" },
  },

  i = {                                                          -- Insert Mode
    -- cut stuffs
    ["<C-x>"] = { "" },
  },

  v = {                                                          -- Visual Mode
    -- comment
    ["<leader>/"] = { "" },
  },

  t = {                                                        -- Terminal Mode
    -- nvterm
    ["<A-i>"] = { "" },
    ["<A-v>"] = { "" },
    ["<A-h>"] = { "" },
  },
}

----------------------------- general keys -----------------------------

M.general = {
  n = {                                                          -- Normal Mode
    ["ç"] = { "<C-v>0", "Block Visual from the begining of the line" },
    ["à"] = { "^", "Go to the first word of the line" },
    ["dà"] = { "d^", "Delete to the begining of the line" },
    ["yà"] = { "mzy^`z", "Yank to the begining of the line" },
    ["é"] = { "~", "Swich the letter case" },
    ["gé"] = { "g~", "Swich the case" },
    ["ù"] = { "%", "Jump to the next pair" },

    -- Use both hands for }
    ["<C-A-=>"] = { "}", "Go to the next paragraph" },

    -- Keep the curson at the same position
    ["y0"] = { "mzy0`z", "Yank to the begining of the line" },
    ["y<Home>"] = { "mzy<Home>`z", "Yank to the end of the line" },
    ["y("] = { "mzy(`z", "Yank to the next paragraph" },
    ["y{"] = { "mzy{`z", "Yank to the next paragraph" },

    -- Keep all in center
    ["J"] = { "mzJ`z", "Merge 2 lines together and add space" },
    ["gJ"] = { "mzgJ`z", "Merge 2 lines together" },
    --
    --["<C-d>"] = { "<C-d>zz", "Scroll down and keep to the middle" },
    --["<C-u>"] = { "<C-u>zz", "Scroll up and keep to the middle" },

    ["n"] = { "nzzzv", "Seach next and keep to the middle" },
    ["N"] = { "Nzzzv", "Search previous and keep to the middle" },

    -- Super clipboard
    ["<C-S-c>"] = { '"+yy:let @"=@0<cr>', opts = { silent = true }, "Copy the line to the system clipboard" },
    ["<C-c>c"] = { '"+yy:let @"=@0<cr>', opts = { silent = true }, "Copy the line to the system clipboard" },
    ["<C-c>à"] = { '"+y^:let @"=@0<cr>', opts = { silent = true }, "Copy to the begining of the line to the system clipboard" },
    ["<C-c>$"] = { '"+y$:let @"=@0<cr>', opts = { silent = true }, "Copy to the end of the line to the system clipboard" },
    ["<C-v>"] = { '"*p', "", "Paste from the system clipboard" },
    ["<C-S-v>"] = { '"*P', "Paste from the system clipboard" },
    ["<C-S-x>"] = { '"+yy:let @"=@0<cr>"_dd', opts = { silent = true }, "Cut to the system clipboard" },
    ["<C-x>x"] = { '"+yy:let @"=@0<cr>"_dd', opts = { silent = true }, "Cut to the system clipboard" },
    ["<C-x>$"] = { '"+y$:let @"=@0<cr>"_dd', opts = { silent = true }, "Cut to the begining of the line to the system clipboard" },
    ["<C-x>à"] = { '"+y^:let @"=@0<cr>"_dd', opts = { silent = true }, "Cut to the end of the line to the system clipboard" },

    ["<A-d>"] = { '"_d', "Delete without yanking" },
    ["<A-d>à"] = { '"_d^', "Delete without yanking to the begining of the line" },
    ["<Delete>"] = { '"_x', "Delete without yanking" },

    -- Work with numbers
    ["<A-=>"] = { "<C-a>", "Increment the number" },
    ["<A-+>"] = { "<C-a>", "Increment the number" },
    ["<A-->"] = { "<C-x>", "Decrement the number" },

    -- Selectections
    ["<S-Up>"] = { "vk", "Select up" },
    ["<S-Down>"] = { "vj", "Select down" },
    ["<S-Left>"] = { "vh", "Select left" },
    ["<S-Right>"] = { "vl", "Select right" },
    ["<S-End>"] = { "v$", "Select to the end of the line" },
    ["<S-Home>"] = { "v0", "Select to the begining of the line" },
    ["<C-S-Home>"] = { "vgg0", "Select to the top of the document" },
    ["<C-S-End>"] = { "vG$", "Select to the end of the document" },
    ["<C-a>"] = { "gg0vG$", "Select all" },

    -- other cmds
    ["<leader>pc"] = { "<cmd> checkhealth <CR>", "Check the health of Neovim" },
  },

  i = {                                                          -- Insert Mode
    -- Tabs
    ["<Tab>"] = { "<C-t>", "Increase the indentation of the line" },
    ["<S-Tab>"] = { "<C-d>", "Decrease the indentation of the line" },

    -- Use both hands for }
      ["<C-A-=>"] = { "}" },

    -- Super clipboard
    ["<C-S-c>"] = { '<Esc>"+yy:let @"=@0<cr>i', opts = { silent = true }, "Copy the line to the system clipboard" },
    ["<C-c>c"] = { '<Esc>"+yy:let @"=@0<cr>i', opts = { silent = true }, "Copy the line to the system clipboard" },
    ["<C-c>à"] = { '<Esc>"+y^:let @"=@0<cr>i', opts = { silent = true }, "Copy to the begining of the line to the system clipboard" },
    ["<C-c>$"] = { '<Esc>"+y$:let @"=@0<cr>i', opts = { silent = true }, "Copy to the end of the line to the system clipboard" },
    ["<C-v>"] = { '<Esc>"*pi', "Paste after from the system clipboard" },
    ["<C-S-v>"] = { '<Esc>"*Pi', "Paste before from the system clipboard" },
    ["<C-S-x>"] = { '<Esc>"+yy:let @"=@0<cr>"_ddi', opts = { silent = true }, "Cut the line to the system clipboard" },
    ["<C-x>x"] = { '<Esc>"+yy:let @"=@0<cr>"_ddi', opts = { silent = true }, "Cut the line to the system clipboard" },
    ["<C-x>à"] = { '<Esc>"+y^:let @"=@0<cr>"_ddi', opts = { silent = true }, "Cut to the begining of the line to the system clipboard" },
    ["<C-x>$"] = { '<Esc>"+y$:let @"=@0<cr>"_ddi', opts = { silent = true }, "Cut to the end of the line to the system clipboard" },

    -- Selections
    ["<S-Up>"] = { "<Esc>vk", "Select up" },
    ["<S-Down>"] = { "<Esc>vj", "Select down" },
    ["<S-Left>"] = { "<Esc>vh", "Select left" },
    ["<S-Right>"] = { "<Esc>vl", "Select right" },
    ["<S-End>"] = { "<Esc>v$", "Select to the end of the line" },
    ["<S-Home>"] = { "<Esc>v0", "Select to the begining of the line" },
    ["<C-S-Home>"] = { "<Esc>vgg0", "Select to the top of the document" },
    ["<C-S-End>"] = { "<Esc>vG$", "Select to the end of the document" },
    ["<C-a>"] = { "<Esc>gg0vG$", "Select all" }
  },

  v = {                                                          -- Visual Mode
    ["é"] = { "~", "Switch the letter case" },
    ["à"] = { "^", "Go to the first word of the line" },

    -- Move lines
    ["<a-k>"] = { ":m '<-2<CR>gv=gv", "Slide up" },
    ["<a-j>"] = { ":m '>+1<CR>gv=gv", "Slide down" },

    -- Super doble clipboard
    ["<A-d>"] = { '"_d', "Delete without yanking" },
    ["<Delete>"] = { '"_d', "Delete without yanking" },

    ["<C-c>"] = { '"+y:let @"=@0<cr><Esc>gv', opts = { silent = true }, "Copy to the system clipboard" },
    ["<C-v>"] = { '"_d"*p', "Paste from system clipboard" },
    ["<C-x>"] = { '"+y:let @"=@0<cr><Esc>gv"_dh', opts = { silent = true }, "Cut to the system clipboard" },

    -- Selectections
    ["<S-Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true }, "Select up" },
    ["<S-Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true }, "Select Down" },
    ["<S-Left>"] = { "h", "Select left" },
    ["<S-Right>"] = { "l", "Select right" },
    ["<S-Home>"] = { "0", "Select to the begining of the line" },
    ["<S-End>"] = { "$", "Select to the end of the line" },
    ["<C-S-Home>"] = { "gg0", "Select to the top of the document" },
    ["<C-S-End>"] = { "G$", "Select to the bottom of the document" },
    ["<C-a>"] = { "<Esc>gg0vG$", "Select all" },

    -- Return to normal mode
    ["<Up>"] = { "<Esc>k", "Up" },
    ["<Down>"] = { "<Esc>j", "Down" },
    ["<Left>"] = { "<Esc>", "Left" },
    ["<Right>"] = { "<Esc>", "Right" },
    ["<Home>"] = { "<Esc>0", "Go to the begining of the line" },
    ["<End>"] = { "<Esc>$", "Go to the end of the line" },
    ["<C-Home>"] = { "<Esc>gg0", "Go to the top of the document" },
    ["<C-End>"] = { "<Esc>G$", "Go to the end of the document" },
    ["<ScrollWheelUp>"] = { "<Esc>", "Scroll up" },
    ["<ScrollWheelDown>"] = { "<Esc>", "Scroll down" }
  },

  t = {                                                        -- Terminal Mode

  },

  c = {                                                         -- Command Mode
    -- Super doble clipboard
    ["<A-p>"] = { '<C-r>"', "Paste to the command line" },
    ["<C-v>"] = { "<C-r>*", "Paste from the system clipboard to the command line" },
  },
}

----------------------------- NvChad plugin keys -----------------------------

M.blankline = {
  --
  -- Normal mode
  --
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

--[[M.comment = {
  n = {                                                          -- Normal Mode
    ["<A-c>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle linewise comment",
    },
  },

  v = {                                                          -- Visual Mode
    ["<A-c>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle linewise comment",
    },
  },
}--]]

M.Lazy = {
  n = {                                                          -- Normal Mode
    ["<leader>ps"] = { "<cmd>Lazy sync<cr>", "Packager sync" },
    ["<leader>pp"] = { "<cmd>Lazy <cr>", "Packager Profile" },
  },
}

M.nvimtree = {
  n = {                                                          -- Normal Mode
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.nvdash = {
  n = {                                                          -- Normal Mode
    ["<C-Home>"] = { "<Cmd> Nvdash <CR>", "Launch the dashboard" },
  }
}

M.nvterm = {
  t = {                                                        -- Terminal Mode
    ["²"] = { "<C-\\><C-n>", "Enter into Terminal Normal mode" },

    ["<A-t>k"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Close floating term",
    },

    ["<A-t>j"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Close down below term",
    },

    ["<A-t>h"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Close left side term",
    },
  },

  n = {                                                          -- Normal Mode
    ["<A-t>k"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Open term in the center",
    },

    ["<A-t>j"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Open down below term",
    },

    ["<A-t>h"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Open left side term",
    },
  },
}

M.spellcheck = {
  n = {                                                          -- Normal Mode
    ["<A-F12>"] = { "<cmd> set spell! <CR>" },
  },

  i = {                                                          -- Insert Mode
    ["<A-F12>"] = { "<cmd> set spell! <CR>", "Toggle Spell checking" },
  },
}

M.tabufline = {
  n = {
    ["<C-Tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Go to next buffer",
    },

    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close the current buffer",
    },
	
    ["<leader><C-S-Tab>"] = { "<Cmd>tabnew <CR>", "Create a new Tab" },
    ["<leader><C-Tab>"] = { "<Cmd>tabn <CR>", "Go to the next Tab" },
    ["<leader><S-Tab>"] = { "<Cmd>tabp <CR>", "Go to the previous Tab" },
  },
}

M.telescope = {
  n = {
    -- Marks
    ["<leader>fm"] = { "<Cmd> Telescope marks <CR>", "Find marks" },

    -- Git
    ["<leader>fg"] = { '<cmd> lua require("telescope").extensions.lazygit.lazygit() <CR>', "Find Git repos" },

    -- Lsp stuffs
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find Symbols" },
	
	["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "Find lsp References" },
	["<leader>fi"] = { "<cmd> Telescope lsp_implementations <CR>", "Find lsp implementations" },

    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick an hidden term" },

    ["<leader>fT"] = { "<cmd> Telescope themes <CR>", "NvChad themes" },
  },
}

----------------------------- Other plugin keys -----------------------------

M.autosave = { n = { ["<leader>as"] = { "<cmd> ASToggle <CR>", "Toggle AutoSave" } } }

M.bookmark = {
  n = {                                                          -- Normal
    ["<leader>bj"] = { "<cmd> BookmarkToggle <CR>", "Add bookmark" },
    ["<leader>bi"] = { "<cmd> BookmarkAnnotate <CR>", "Annotate bookmark" },
    ["<leader>bl"] = { "<cmd> BookmarkNext <CR>", "Next bookmark" },
    ["<leader>bh"] = { "<cmd> BookmarkPrev <CR>", "Prev bookmark" },
    ["<leader>bk"] = { "<cmd> BookmarkClear <CR>", "Clear bookmarks" },
    ["<leader>bo"] = { "<cmd> BookmarkShowAll <CR>", "Show bookmarks" },
    ["<leader>bmk"] = { "<cmd> BookmarkMoveUp <CR>", "Move bookmark up" },
    ["<leader>bmj"] = { "<cmd> BookmarkMoveDown <CR>", "Move bookmark down" },
    ["<leader>bml"] = { "<cmd> BookmarkMoveToLine <CR>", "Move bookmark to line" },
    --@@ ["<leader>bm"] = { "<cmd>Telescope vim_bookmarks all <CR>", " Bookmark Menu" },
  },
}

M.dap = {                                                          -- Normal
  n = {
    ["<leader>dd"] = {
      function()
        require("dap").continue()
      end,
      "Start debugging",
    },
    ["<leader>dso"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<leader>dsi"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    ["<leader>dsO"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },
    ["<leader>dsb"] = {
      function()
        require("dap").step_back()
      end,
      "Step back",
    },
    ["<leader>dsc"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to cursor",
    },
    ["<leader>dt"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint",
    },
    ["<leader>dc"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear all the breakpoints",
    },
    ["<leader>dL"] = {
      function()
        require("dap").list_breakpoints()
        vim.cmd "TroubleToggle quickfix"
      end,
      "Open all the breakpoints in the Quicklist",
    },
    ["<leader>db"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Set breakpoint",
    },
    ["<leader>dl"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end,
      "Set breakpoint / message",
    },
    ["<leader>dR"] = {
      function()
        require("dap").repl.open()
      end,
      "Replace open",
    },
    ["<leader>dr"] = {
      function()
        require("dap").run_last()
      end,
      "Run last",
    },
    ["<leader>dq"] = {
      function()
        require("dap").terminate()
        require("dap").clear_breakpoints()
        require("dap").close()
        require("dapui").close()
      end,
      "Terminate"
    }
  }
}

M.gitsigns = {
  n = {                                                          -- Normal Mode
    -- Navigation through hunks
    ["<leader>gl"] = {
      function()
        if vim.wo.diff then
          return "<leader>gl"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<leader>gh"] = {
      function()
        if vim.wo.diff then
          return "<leader>gh"
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

M.guizoom = {
  n = {                                                          -- Normal Mode
    ["+"] = { "<cmd> ZoomIn <CR>", "Zoom in" },
    ["-"] = { "<cmd> ZoomOut <CR>", "Zoom out" },
    ["<C-ScrollWheelUp>"] = { "<cmd> ZoomIn <CR>", "Zoom in" },
    ["<C-ScrollWheelDown>"] = { "<cmd> ZoomOut <CR>", "Zoom out" }
  }
}

M.harpoon = {
  n = {                                                          -- Normal Mode
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon Add file",
    },
    --@@ ["<leader>ht"] = { "<cmd>Telescope harpoon marks<CR>", "Toggle quick menu" },
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

M.lazygit = { n = { ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Lazygit" } } }

M.lspconfig = {
  n = {                                                          -- Normal Mode
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
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
  }
}

M.trouble = {
  n = {                                                          -- Normal Mode
    ["<leader>lr"] = { "<cmd> TroubleToggle lsp_references <CR>", "LSP References" },
	
	["<leader>li"] = { "<cmd> TroubleToggle lsp_implementations <CR>", "LSP Implementation" },

    ["<leader>lx"] = { "<cmd> TroubleToggle document_diagnostics <CR>", "LSP Document Diagnostics" },
    ["<leader>lWx"] = { "<cmd> TroubleToggle workspace_diagnostics <CR>", "LSP Workspace Diagnostics" },

    ["<leader>ll"] = { "<cmd> TroubleToggle loclist <CR>", "Loclist" },
	
    ["<leader>lq"] = { "<cmd> TroubleToggle quickfix <CR>", "Quickfix list" },
  }
}

M.lspsaga = {                                                          -- Normal
  n = {	
	["<leader>la"] = { "<cmd> Lspsaga code_action <CR>", "LSP code action" },

	["<leader>ld"] = { "<cmd> Lspsaga goto_definition <CR>", "LSP Definition" },
	["<leader>lwd"] = { "<cmd> Lspsaga peek_definition <CR>", "LSP preview definition" },
	
	["<leader>lt"] = { "<cmd> Lspsaga goto_type_definition <CR>", "LSP Definition" },
	["<leader>lwt"] = { "<cmd> Lspsaga peek_type_definition <CR>", "LSP preview type definition" },
	
	["<F2>"] = { "<cmd> Lspsaga rename <CR>", "LSP rename" },

	["K"] = { "<cmd> Lspsaga hover_doc <CR>", "Hover documentation" },
	
	["<leader>lxh"] = { "<cmd> Lspsaga diagnostic_jump_prev <CR>", "LSP previous diagnostic" },
	["<leader>lxl"] = { "<cmd> Lspsaga diagnostic_jump_next <CR>", "LSP next diagnostic" },
	["<leader>lxj"] = { "<cmd> Lspsaga show_line_diagnostics <CR>", "LSP line diagnostic" },
	["<leader>lxk"] = { "<cmd> Lspsaga show_cursor_diagnostics <CR>", "LSP cursor diagnostic" },
  }
}

M.minimap = {                                                          -- Normal
  n = {
    ["<A-c>"] = { "<Cmd> MinimapToggle <CR>", "Toggle the minimap window" },
  }
}

M.possession = {
  n = {                                                          -- Normal Mode
    ["<leader>Ss"] = { ":PossessionSave ", "Save the session as..." },
    ["<leader>Sl"] = { "<Cmd> Telescope Possession list <CR>", "List all the sessions" },
    ["<leader>Sc"] = { "<Cmd> PossessionClose <CR>", "Close the current session" },
    ["<leader>Sd"] = { "<Cmd> PossessionDelete <CR>", "Delete the current session" },
  }
}

M.surround = {
  n = {                                                          -- Normal Mode
    ["<A-s>["] = { 'mz<Cmd> let g:surround_{char2nr("o")} = "[\\r]" <CR><Plug>Ysurroundiwo `zl', "Surround with [ ]" },
    ["<A-s>("] = { 'mz<Cmd> let g:surround_{char2nr("o")} = "(\\r)" <CR><Plug>Ysurroundiwo `zl', "Surround with ( )" },
    ["<A-s>/"] = { 'mz<Cmd> let g:surround_{char2nr("o")} = "/\\r/" <CR><Plug>Ysurroundiwo `zl', "Surround with / /" },
    ["<A-s>{"] = { 'mz<Cmd> let g:surround_{char2nr("o")} = "{\\r}" <CR><Plug>Ysurroundiwo `zl', "Surround with { }" },
    ["<A-s>]"] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "[[\\r]]" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with [[ ]]",
    },
    ['<A-s>"'] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "\\"\\r\\"" <CR><Plug>Ysurroundiwo `zl',
      'Surround with " "',
    },
    ["<A-s>è"] = { 'mz<Cmd> let g:surround_{char2nr("o")} = "`\\r`" <CR><Plug>Ysurroundiwo `zl', "Surround with ` `" },
    ["<A-s>c"] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "```\\r```" <CR><Plug>Ysurroundiwo `z3l',
      "Surround with ``` ```",
    },
    ["<A-s>h"] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "==\\r==" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with == ==",
    },
    ["<A-s>u"] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "<u>\\r</u>" <CR><Plug>Ysurroundiwo `z3l',
      "Surround with <u> </u>",
    },
    ["<A-s>b"] = {
      'mz<Cmd> let g:surround_{char2nr("o")} = "**\\r**" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with ** **",
    },
    ["<A-s>i"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "__\\r__" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with __ __",
    },
    ["<A-s>s"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "~~\\r~~" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with ~~ ~~",
    },
    ["<A-s>f"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "**_`\\r`_**" <CR><Plug>Ysurroundiwo `z4l',
      "Surround with **_` `_**",
    },
    ["<A-s>d"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "_`\\r`_" <CR><Plug>Ysurroundiwo `z2l',
      "Surround with _` `_",
    }
  },

  i = {                                                          -- Insert Mode
    ["<A-s>["] = { '<Cmd> let g:surround_{char2nr("o")} = "[\\r]" <CR><Plug>Isurroundo', "Surround with [ ]" },
    ["<A-s>("] = { '<Cmd> let g:surround_{char2nr("o")} = "(\\r)" <CR><Plug>Isurroundo', "Surround with ( )" },
    ["<A-s>/"] = { '<Cmd> let g:surround_{char2nr("o")} = "/\\r/" <CR><Plug>Isurroundo', "Surround with / /" },
    ["<A-s>{"] = { '<Cmd> let g:surround_{char2nr("o")} = "{\\r}" <CR><Plug>Isurroundo', "Surround with { }" },
    ["<A-s>]"] = { '<Cmd> let g:surround_{char2nr("o")} = "[[\\r]]" <CR><Plug>Isurroundo', "Surround with [[ ]]" },
    ['<A-s>"'] = { '<Cmd> let g:surround_{char2nr("o")} = "\\"\\r\\"" <CR><Plug>Isurroundo', 'Surround with " "' },
    ["<A-s>è"] = { '<Cmd> let g:surround_{char2nr("o")} = "`\\r`" <CR><Plug>Isurroundo', "Surround with ` `" },
    ["<A-s>c"] = { '<Cmd> let g:surround_{char2nr("o")} = "```\\r```" <CR><Plug>Isurroundo', "Surround with ``` ```" },
    ["<A-s>h"] = { '<Cmd> let g:surround_{char2nr("o")} = "==\\r==" <CR><Plug>Isurroundo', "Surround with == ==" },
    ["<A-s>u"] = { '<Cmd> let g:surround_{char2nr("o")} = "<u>\\r</u>" <CR><Plug>Isurroundo', "Surround with <u> </u>" },
    ["<A-s>b"] = { '<Cmd> let g:surround_{char2nr("o")} = "**\\r**" <CR><Plug>Isurroundo', "Surround with ** **" },
    ["<A-s>i"] = { '<Cmd> let g:surround_{char2nr("o")} = "__\\r__" <CR><Plug>Isurroundo', "Surround with __ __" },
    ["<A-s>s"] = { '<Cmd> let g:surround_{char2nr("o")} = "~~\\r~~" <CR><Plug>Isurroundo', "Surround with ~~ ~~" },
    ["<A-s>f"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "**_`\\r`_**" <CR><Plug>Isurroundo',
      "Surround with **_` `_**",
    },
    ["<A-s>d"] = { '<Cmd> let g:surround_{char2nr("o")} = "_`\\r`_" <CR><Plug>Isurroundo', "Surround with _` `_" },
  },

  v = {                                                          -- Visual Mode
    ["<A-s>["] = { '<Cmd> let g:surround_{char2nr("o")} = "[\\r]" <CR><Plug>VSurroundo', "Surround with [ ]" },
    ["<A-s>("] = { '<Cmd> let g:surround_{char2nr("o")} = "(\\r)" <CR><Plug>VSurroundo', "Surround with ( )" },
    ["<A-s>/"] = { '<Cmd> let g:surround_{char2nr("o")} = "/\\r/" <CR><Plug>VSurroundo', "Surround with / /" },
    ["<A-s>{"] = { '<Cmd> let g:surround_{char2nr("o")} = "{\\r}" <CR><Plug>VSurroundo', "Surround with { }" },
    ["<A-s>]"] = { '<Cmd> let g:surround_{char2nr("o")} = "[[\\r]]" <CR><Plug>VSurroundo', "Surround with [[ ]]" },
    ['<A-s>"'] = { '<Cmd> let g:surround_{char2nr("o")} = "\\"\\r\\"" <CR><Plug>VSurroundo', 'Surround with " "' },
    ["<A-s>è"] = { '<Cmd> let g:surround_{char2nr("o")} = "`\\r`" <CR><Plug>VSurroundo', "Surround with ` `" },
    ["<A-s>c"] = { '<Cmd> let g:surround_{char2nr("o")} = "```\\r```" <CR><Plug>VSurroundo', "Surround with ``` ```" },
    ["<A-s>h"] = { '<Cmd> let g:surround_{char2nr("o")} = "==\\r==" <CR><Plug>VSurroundo', "Surround with == ==" },
    ["<A-s>u"] = { '<Cmd> let g:surround_{char2nr("o")} = "<u>\\r</u>" <CR><Plug>VSurroundo', "Surround with <u> </u>" },
    ["<A-s>b"] = { '<Cmd> let g:surround_{char2nr("o")} = "**\\r**" <CR><Plug>VSurroundo', "Surround with ** **" },
    ["<A-s>i"] = { '<Cmd> let g:surround_{char2nr("o")} = "__\\r__" <CR><Plug>VSurroundo', "Surround with __ __" },
    ["<A-s>s"] = { '<Cmd> let g:surround_{char2nr("o")} = "~~\\r~~" <CR><Plug>VSurroundo', "Surround with ~~ ~~" },
    ["<A-s>f"] = {
      '<Cmd> let g:surround_{char2nr("o")} = "**_`\\r`_**" <CR><Plug>VSurroundo',
      "Surround with **_` `_**",
    },
    ["<A-s>d"] = { '<Cmd> let g:surround_{char2nr("o")} = "_`\\r`_" <CR><Plug>VSurroundo', "Surround with _` `_" },
  }
}

M.symbolsoutline = {                                                          -- Normal Mode
  n = {
    ["<A-m>"] = { "<cmd> SymbolsOutline <CR>", "Toggle Map Symbols tree" },
  }
}

M.togglelspdiagunderline = {
  n = {                                                          -- Normal Mode
    -- ["<F12>"] = { "<Plug>(toggle-lsp-diag-underline) <Plug>(toggle-lsp-diag-vtext) <Esc>hh", { noremap = false } },
    ["<F12>"] = { "<Plug>(toggle-lsp-diag-underline) <Plug>(toggle-lsp-diag-vtext) <Esc>hh", "Toggle the diagnostics" },
  }
}

M.truezen = { n = { ["<C-z>"] = { "<Cmd> TZFocus <CR>", "Maximize the current window" } } }

M.undotree = { n = { ["<A-u>"] = { "<cmd> UndotreeToggle <CR>", "Toggle UndoTree" } } }

M.whichkey = { n = { ["<leader>wc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" } } }

return M
