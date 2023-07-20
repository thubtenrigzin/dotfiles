local opt = vim.opt
local g = vim.g

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
opt.iskeyword:append("-")

opt.rnu = true
opt.scrolloff = 8
opt.wrap = false
opt.colorcolumn = "80"

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.updatetime = 50

opt.clipboard = ""

-- Spellcheck in 3 languages
opt.spell = false
opt.spelllang = { "fr", "en", "es" }

-- snippets path
g.vscode_snippets_path = vim.fn.stdpath "config" .. "\\lua\\custom\\snippets"

-- Folding settings
-- zc fold block
-- zo unfold block
-- zM fold all blocks
-- zR unfold all blocks
-- za toggle folding
opt.foldcolumn = "1" -- show foldcolumn in nvim 0.9
opt.foldlevel = 1
opt.foldnestmax = 1
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
