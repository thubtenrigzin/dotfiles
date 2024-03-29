local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
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
opt.updatetime = 100

opt.clipboard = ""

opt.list = false
opt.listchars = { space = "·", tab = "→ ", nbsp = "␣", trail = "•", eol = "¶", precedes = "«", extends = "»" }

--
-- Spellcheck
--
opt.spell = false
opt.spelllang = { "fr", "en", "es" }

--
-- Folding settings
--
--[[
- zc fold block
- zo unfold block
- zM fold all blocks
- zR unfold all blocks
- za toggle folding
--]]
opt.foldcolumn = "1" -- show foldcolumn in nvim 0.9
opt.foldlevel = 1
opt.foldnestmax = 1
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
