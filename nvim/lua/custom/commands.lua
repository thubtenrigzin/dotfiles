local autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command

local g = vim.g
local cmd = vim.cmd

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
      cmd "NvimTreeToggle"
    end
  end,
})

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


--
-- Autosave
--
g.autosave = false

autocmd({ "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("Autosave", {}),
  callback = function()
    if g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.notify( string.format(" File autosaved at %s", os.date "%I:%M:%S %p"), "info", {
        title = "Autosave",
        on_open = function()
          cmd "silent w"
        end
      })
    end
  end,
})

create_cmd("AutosaveToggle", function()
  vim.notify( "Autosave is " .. (g.autosave and "OFF" or "ON") , "info", {
    title = "Autosave",
    icon = "",
    on_open = function()
      g.autosave = not g.autosave
    end
  })
end, {})

--
-- Codeium
--
g.codeium = false

create_cmd("CodeiumToggle", function()
  vim.notify( "Codeium is " .. (g.codeium and "OFF" or "ON") , "info", {
    title = "Codeium",
    icon = "",
    on_open = function()
      g.codeium = not g.codeium
      if g.codeium then
        cmd "CodeiumEnable"
      else
        cmd "CodeiumDisable"
      end
    end
  })
end, {})
