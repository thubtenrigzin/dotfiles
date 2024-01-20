local opt = vim.opt
local g = vim.g

if g.neovide then
  opt.guifont = { "JetBrainsMono NF:h18" }

  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_trail_size = 0.1
  g.neovide_hide_mouse_when_typing = true
end
