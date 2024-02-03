local present, neogen = pcall(require, "neogen")

if not present then
  return
end

neogen.setup {
  snippet_engine = "luasnip",

  languages = {
    python = {
      template = {
        annotation_convention = "google_docstrings",
      },
    },
  },
}

