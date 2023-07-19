local autocmd = vim.api.nvim_create_autocmd

-- highlight the Yank
autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd("BufEnter", {
   callback = function()
     if vim.fn.isdirectory(vim.v.argv[4]) == 1 then
	   vim.cmd "NvimTreeToggle"
      end
   end,
})

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
