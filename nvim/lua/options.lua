local opt = vim.opt

-- auto & usr commands
require "commands"

-- neovide options
require "neovide"

-- vim options
require "nvchad.options"

opt.iskeyword:append "-"

opt.rnu = true
opt.scrolloff = 8
opt.textwidth = 0
opt.wrap = false
opt.colorcolumn = "80"

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.updatetime = 100 -- @@

opt.clipboard = ""

opt.list = false
opt.listchars = { space = "·", tab = "→ ", nbsp = "␣", trail = "•", eol = "¶", precedes = "«", extends = "»" }
opt.fillchars = { eob = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }

--
-- Spellcheck
--
opt.spell = false
opt.spelllang = { "fr", "en", "es" }
