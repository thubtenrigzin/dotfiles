local present, wk = pcall(require, "which-key")

if not present then
  return
end

wk.register( {
  -- add group
  ["<leader>"] = {
    l = {name="+LSP"},
    p = {name="+Packer"},
    s = {name="+Surround"},
    w = {name="+WhichKey"},
  }
})
