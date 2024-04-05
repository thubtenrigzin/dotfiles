require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

--
-- unmap keys
--

-- blankline
unmap("n", "<leader>cc")

-- cheatsheet
unmap("n", "<leader>ch")

-- comment
unmap({ "n", "v" }, "<leader>/")

-- git
--unmap("n", "<leader>rh")
--unmap("n", "<leader>ph")

-- linenumber
unmap("n", "<leader>rn")

-- LSP stuffs
unmap("n", "[d")
unmap("n", "]d")

-- nav in insert mode
unmap("i", "<C-b>")
unmap("i", "<C-e>")
unmap("i", "<C-h>")
unmap("i", "<C-l>")
unmap("i", "<C-j>")
unmap("i", "<C-k>")

-- nvimtree
unmap("n", "<leader>e")

-- nvterm
unmap({ "n", "t" }, "<A-i>")
unmap({ "n", "t" }, "<A-v>")
unmap({ "n", "t" }, "<A-h>")
unmap("n", "<leader>h")
unmap("n", "<leader>v")

-- tabufline
unmap("n", "<leader>b")
unmap("n", "<tab>")
unmap("n", "<S-tab>")
unmap("n", "<leader>x")

-- telescope
unmap("n", "<leader>gt")
unmap("n", "<leader>pt")
unmap("n", "<leader>th")

--
-- general keys
--

-- Inspect code
map("n", "<S-h>k", "<cmd> Inspect <CR>", { desc = "Hightlight the group under the cursor" })
map("n", "<S-h>l", "<cmd> InspectTree <CR>", { desc = "Hightlight the group under the cursor" })

-- numbers
map("n", "<A-+>", "<C-a>", { desc = "Number Increment the number" })
map("n", "<A-->", "<C-x>", { desc = "Number Decrement the number" })

-- save in insert mode
map({ "n", "i" }, "<C-s>", "<cmd> w <CR>", { desc = "File Save" })

-- Selection
map("n", "<C-a>", "gg0vG$", { desc = "Select All document" })

map("n", "<C-S-v>", "<C-v>", { desc = "Select Block Visual mode" })

-- Move lines
map("v", "<a-k>", ":m '<-2 <CR>gv=gv", { silent = true, desc = "Select Slide up" })
map("v", "<a-j>", ":m '>+1 <CR>gv=gv", { silent = true, desc = "Select Slide down" })

-- checkhealth
map("n", "<leader>pc", "<cmd> checkhealth <CR>", { desc = "Checkhealth Run tests" })

-- spellcheck
map("n", "<A-F12>", "<cmd> set spell! <CR>", { desc = "Spellchecker Toggle spell checking" })

-- Super double clipboard
-- normal mode
map("n", "<C-c>", '"+yy:let @"=@0<cr>', { silent = true, desc = "Clipboard Copy the line to the system clipboard" })
map("n", "<C-x>", '"+yy:let @"=@0<cr>"_dd', { silent = true, desc = "Clipboard Cut the line to the system clipboard" })
map("n", "<C-v>", '"*p', { desc = "Clipboard Paste from the system clipboard" })

-- insert mode
map("i", "<C-v>", '<Esc>"*pi', { desc = "Clipboard Paste after from the system clipboard" })

-- visual mode
map("v", "<C-c>", '"+y:let @"=@0<cr>', { silent = true, desc = "Clipboard Copy to the system clipboard" })
map("v", "<C-x>", '"+y:let @"=@0<cr><Esc>gv"_d', { silent = true, desc = "Clipboard Cut to the system clipboard" })
map("v", "<C-v>", '"_d"*P', { desc = "Clipboard Paste from system clipboard" })

-- command mode
map("c", "<A-p>", '<C-r>"', { desc = "Paste to the command line" })
map("c", "<C-v>", "<C-r>*", { desc = "Paste from the system clipboard to the command line" })

-- No yanking
map({ "n", "v" }, "<A-d>", '"_d', { desc = "Clipboard Delete without yanking" })
map({ "n", "v" }, "<A-x>", '"_x', { desc = "Clipboard Delete without yanking" })

-- wrapping & autoformat
map("n", "<A-F11>", "<cmd> TextWidthToggle <CR>", { desc = "toggle the textWidth option" })
map("n", "<F11>", "mzgg0gqG`z<cmd> set fo+=a <CR>", { desc = "toggle the characters wrapping" })

map("n", "<C-F12>", "<cmd> set list! <CR>", { desc = "toggle hidden characters" })

--
-- NvChad default plugin keys
--

-- blankline
map("n", "<leader>lc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Blankline Jump to current context" })

-- nvdash
map("n", "<C-Home>", "<cmd> Nvdash <CR>", { desc = "Dashboard Launch it!" })

-- nvimtree
map("n", "<A-e>", "<cmd> NvimTreeToggle <CR>", { desc = "Nvimtree Toggle window" })

-- packager
map("n", "<leader>ps", "<cmd> Lazy sync <CR>", { desc = "Packager Sync" })
map("n", "<leader>pp", "<cmd> Lazy <CR>", { desc = "Packager Profile" })

-- tabufline
map("n", "<C-n>", "<cmd> enew <CR>", { desc = "Buffer New" })

map("n", "<C-Tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<C-S-Tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<C-q>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map("n", "<leader>n", "<cmd> tabnew <CR>", { desc = "Create a new tab" })
map("n", "<leader>q", "<cmd> tabclose <CR>", { desc = "Close the tab" })

-- telescope
-- bookmarks
map("n", "<leader>fB", "<cmd> Telescope vim_bookmarks all <CR>", { desc = "Telescope Find bookmarks" })

-- dap
map("n", "<leader>fdc", "<cmd> Telescope dap commands <CR>", { desc = "Telescope Find dap commands" })
map("n", "<leader>fdC", "<cmd> Telescope dap configuration <CR>", { desc = "Telescope Find dap configuration" })
map("n", "<leader>fdb", "<cmd> Telescope dap list_breakpoints <CR>", { desc = "Telescope Find dap breakpoints" })
map("n", "<leader>fdv", "<cmd> Telescope dap variables <CR>", { desc = "Telescope Find dap variables" })
map("n", "<leader>fdf", "<cmd> Telescope dap frames <CR>", { desc = "Telescope Find dap frames" })

-- File browser
map("n", "<leader>fF", "<cmd> Telescope file_browser <CR>", { desc = "Telescope File explorer" })

-- Git
map(
  "n",
  "<leader>fgr",
  '<cmd> lua require("telescope").extensions.lazygit.lazygit() <CR>',
  { desc = "Telescope Find Git repos" }
)
map("n", "<leader>fgs", "<cmd> Telescope git_status <CR>", { desc = "Telescope Git status" })
map("n", "<leader>fgc", "<cmd> Telescope git_commits <CR>", { desc = "Telescope Git commits" })

-- Marks
map("n", "<leader>fm", "<cmd> Telescope marks <CR>", { desc = "Telescope Find marks" })

-- Possession
map("n", "<leader>fS", "<cmd> Telescope Possession list <CR>", { desc = "Telescope List the sessions" })

-- Lsp stuffs
map("n", "<leader>fs", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Find Symbols" })
map(
  "n",
  "<leader>fWs",
  "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>",
  { desc = "Telescope Find Symbols in workspace" }
)

map("n", "<leader>fr", "<cmd> Telescope lsp_references <CR>", { desc = "Telescope Find References" })
map("n", "<leader>fi", "<cmd> Telescope lsp_implementations <CR>", { desc = "Telescope Find implementations" })

-- pick a hidden term
map("n", "<leader>fT", "<cmd> Telescope terms <CR>", { desc = "Telescope Pick an hidden term" })

-- pick a NvChad theme
map("n", "<leader>ft", "<cmd> Telescope themes <CR>", { desc = "Telescope NvChad themes" })

-- undo
map("n", "<leader>fu", "<cmd> Telescope undo <CR>", { desc = "Telescope Find in undo tree" })

-- terminal
map({ "n", "t" }, "<F3>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<F5>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<F4>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- whichkey
map("n", "<leader>fk", "<cmd> NvCheatsheet <CR>", { desc = "Whichkey Show the cheatsheet" })

--
-- other plugins
--

-- autosave
map("n", "<leader>as", "<cmd> AutosaveToggle <CR>", { desc = "Autosave Toggle" })

-- bookmark
map("n", "<leader>bj", "<cmd> BookmarkToggle <CR>", { desc = "Bookmark Add bookmark" })
map("n", "<leader>bi", "<cmd> BookmarkAnnotate <CR>", { desc = "Bookmark Annotate bookmark" })
map("n", "<leader>bl", "<cmd> BookmarkNext <CR>", { desc = "Bookmark Next bookmark" })
map("n", "<leader>bh", "<cmd> BookmarkPrev <CR>", { desc = "Bookmark Prev bookmark" })
map("n", "<leader>bk", "<cmd> BookmarkClear <CR>", { desc = "Bookmark Clear bookmarks" })
map("n", "<leader>bo", "<cmd> BookmarkShowAll <CR>", { desc = "Bookmark Show bookmarks" })
map("n", "<leader>bmk", "<cmd> BookmarkMoveUp <CR>", { desc = "Bookmark Move bookmark up" })
map("n", "<leader>bmj", "<cmd> BookmarkMoveDown <CR>", { desc = "Bookmark Move bookmark down" })
map("n", "<leader>bml", "<cmd> BookmarkMoveToLine <CR>", { desc = "Bookmark Move bookmark to line" })

-- coc =
--map("n", "<leader>vs", "<cmd> CocCommand volar.action.splitEditors <CR>", { desc = "CoC Split Vue file in 3 windows" })

-- codeium
map("n", "<leader>cm", "<cmd> CodeiumOn <CR>", { desc = "Codeium Run it!" })

-- compiler
map("n", "<C-F4>", "<cmd> CompilerOpen <CR>", { desc = "Compiler Run it!" })

-- copilot
map("n", "<leader>cp", "<cmd> CopilotToggle <CR>", { desc = "Copilot Toggle" })

-- dap
map("n", "<F6>", function()
  require("dap").continue()
end, { desc = "Start debugging" })

map("n", "<F8>", function()
  require("dap").step_over()
end, { desc = "Step over" })

map("n", "<F7>", function()
  require("dap").step_into()
end, { desc = "Step into" })

map("n", "<C-F7>", function()
  require("dap").step_out()
end, { desc = "Step out" })

map("n", "<C-F8>", function()
  require("dap").step_back()
end, { desc = "Step back" })

map("n", "<A-F6>", function()
  require("dap").run_to_cursor()
end, { desc = "Run to cursor" })

map("n", "<F10>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

map("n", "<C-A>F10", function()
  require("dap").clear_breakpoints()
end, { desc = "Clear all the breakpoints" })

map("n", "<A-F10>", function()
  require("dap").list_breakpoints()
  vim.cmd "TroubleToggle quickfix"
end, { desc = "Open all the breakpoints in the Quicklist" })

map("n", "<C-F10>", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Set breakpoint" })

map("n", "<A-F9", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set breakpoint / message" })

map("n", "<C-A-F6>", function()
  require("dap").repl.open()
end, { desc = "Replace open" })

map("n", "<C-F6>", function()
  require("dap").run_last()
end, { desc = "Run last" })

map("n", "<F9>", function()
  require("dap").terminate()
  require("dap").clear_breakpoints()
  require("dap").close()
  require("dapui").close()
end, { desc = "Terminate" })

-- dropbar
map("n", "<A-k>", function()
  require("dropbar.api").pick()
end, { desc = "Dropbar Navigate into the menu" })

-- guizoom
map("n", "+", "<cmd> ZoomIn <CR>", { desc = "Guizoom Zoom in" })
map("n", "-", "<cmd> ZoomOut <CR>", { desc = "Guizoom Zoom out" })

-- harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon Add file" })

map("n", "<leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon Menu" })

map("n", "<leader>hj", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to file 1" })

map("n", "<leader>hk", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to file 2" })

map("n", "<leader>hl", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to file 3" })

map("n", "<leader>hh", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Navigate to file 4" })

-- iconpicker
map("n", "<leader>:", "<cmd> IconPickerNormal <CR>", { desc = "Iconpicker Pick an icon" })

-- lazygit
map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "Lazygit Run it!" })

-- minimap
map("n", "<leader>mm", "<cmd> MinimapToggle <CR>", { desc = "Minimap Toggle" })

-- muren
map("n", "<A-F2>", "<cmd> MurenToggle <CR>", { desc = "Muren Toggle the search window" })

-- neogen
map("n", "<leader>d", function()
  require("neogen").generate()
end, { desc = "Neogen Generate docstring" })

-- possession
map("n", "<leader>ss", ":PossessionSave ", { desc = "Possession Save the session as..." })
map("n", "<leader>sc", "<cmd> PossessionClose <CR>", { desc = "Possession Close the current session" })
map("n", "<leader>sd", "<cmd> PossessionDelete <CR>", { desc = "Possession Delete the current session" })

-- refactoring
map("n", "<leader>rb", "<cmd> Refactor extract_block <CR>", { desc = "Refactor Extract Block" })
map("n", "<leader>rB", "<cmd> Refactor extract_block_to_file <CR>", { desc = "Refactor Extract Block to File" })

map({ "n", "v" }, "<leader>ri", "<cmd> Refactor inline_var <CR>", { desc = "Refactor Inline Var" })

map({ "n", "v" }, "<leader>rj", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor Prompt" })

map("v", "<leader>re", "<cmd> Refactor extract <CR>", { desc = "Refactor extract" })
map("v", "<leader>rE", "<cmd> Refactor extract_to_file <CR>", { desc = "Refactor Extract to File" })
map("v", "<leader>rv", "<cmd> Refactor extract_var <CR>", { desc = "Refactor Extract Var" })

-- sidebar
map("n", "<leader>hs", "<cmd> SidebarNvimToggle <CR>", { desc = "Sidebar Toggle" })

-- symbolsoutline
map("n", "<leader>ms", "<cmd> SymbolsOutline <CR>", { desc = "Symbolsoutline Toggle Map Symbols tree" })

-- toggler
map("n", "<leader>;", function()
  require("nvim-toggler").toggle()
end, { desc = "Toggler Invert the value" })

-- truezen
map("n", "<leader>z", "<cmd> TZFocus <CR>", { desc = "Truezen Maximize the current window" })

-- undotree
map("n", "<C-z>", "<cmd> UndotreeToggle <CR>", { desc = "Undotree Toggle" })

-- venvselector
map("n", "<leader>ve", "<cmd> VenvSelect <CR>", { desc = "Venvselector Pick a venv" })
