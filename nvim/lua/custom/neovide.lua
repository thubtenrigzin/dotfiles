--[[
TODO:
more on neovide config
--]]

local opt = vim.opt
local g = vim.g

if g.neovide then
  opt.guifont = {"JetBrainsMono NF", ":h14"}

  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.1
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_remember_window_size = true
  g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_trail_length=0
end

