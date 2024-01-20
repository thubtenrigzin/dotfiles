local present, toggler = pcall(require, "nvim-toggler")

if not present then
  return
end

toggler.setup {
  inverses = {
    ["True"] = "False",
    ["true"] = "false",
    ["ON"] = "OFF",
    ["0"] = "1",
    ["=="] = "!=",
    [">"] = "<",
    [">="] = "<=",
    ["OR"] = "AND",
  },

  remove_default_keybinds = true,
}
