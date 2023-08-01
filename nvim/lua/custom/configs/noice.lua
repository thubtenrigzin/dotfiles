local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup {
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
}
