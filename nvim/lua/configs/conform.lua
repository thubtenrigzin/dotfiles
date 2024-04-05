local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    typescript = { "prettier" },
  },
}

require("conform").setup(options)
