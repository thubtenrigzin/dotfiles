local autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command

local g = vim.g
local cmd = vim.cmd

--
-- highlight the Yank
--
autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

--
-- Switch the text wrapping
--
g.textwidth = false

create_cmd("TextWidthToggle", function()
  vim.notify("The text wrapping is " .. (g.textwidth and "OFF" or "ON"), "info", {
    title = "TextWidth",
    icon = "",
    on_open = function()
      g.textwidth = not g.textwidth
      if g.textwidth then
        cmd "set textwidth=80"
      else
        cmd "set textwidth=0"
      end
    end,
  })
end, {})

--
-- Open nvim-tree for directories
--
autocmd("UIEnter", {
  once = true,
  callback = function(opts)
    local no_name = opts.file == "" and vim.bo[opts.buf].buftype == ""

    -- buffer is a directory
    local directory = vim.fn.isdirectory(opts.file) == 1

    if not no_name and not directory then
      return
    end
    if directory then
      vim.cmd.cd(opts.file)
      require("lazy.core.loader").load({ "nvim-tree.lua" }, {})
      vim.cmd.NvimTreeToggle()
    end
  end,
})

--
-- Autosave
--
g.autosave = false

autocmd({ "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("Autosave", {}),
  callback = function()
    if g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.notify(string.format(" File autosaved at %s", os.date "%I:%M:%S %p"), "info", {
        title = "Autosave",
        on_open = function()
          cmd "silent w"
        end,
      })
    end
  end,
})

create_cmd("AutosaveToggle", function()
  vim.notify("Autosave is " .. (g.autosave and "OFF" or "ON"), "info", {
    title = "Autosave",
    icon = "",
    on_open = function()
      g.autosave = not g.autosave
    end,
  })
end, {})

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

--
-- Codeium
--
g.codeium = false

create_cmd("CodeiumOn", function()
  vim.notify("Codeium is " .. (g.codeium and "OFF" or "ON"), "info", {
    title = "Codeium",
    icon = "",
    on_open = function()
      g.codeium = true
      cmd "Codeium"
    end,
  })
end, {})

--
-- Copilot
--
g.copilot = false
g.first = false

create_cmd("CopilotToggle", function()
  vim.notify("Copilot is " .. (g.copilot and "OFF" or "ON"), "info", {
    title = "Copilot",
    icon = "",
    on_open = function()
      g.copilot = not g.copilot
      if g.first then
        if g.copilot then
          cmd "Copilot enable"
        else
          cmd "Copilot disable"
        end
      else
        cmd "Copilot"
        g.first = true
      end
    end,
  })
end, {})
