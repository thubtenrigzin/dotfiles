local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup {
  popupmenu = {
    enabled = false,
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },

  messages = {
    enabled = false,
  },
}
