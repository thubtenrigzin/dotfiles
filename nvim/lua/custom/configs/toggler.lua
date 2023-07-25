local present, toggler = pcall(require, "nvim-toggler")

if not present then
  return
end

toggler.setup {
  inverses = {
    ["vim"] = "emacs",
    ["True"] = "False",
    ["ON"] = "OFF",
    ["0"] = "1",
  },

  remove_default_keybinds = true,
}
