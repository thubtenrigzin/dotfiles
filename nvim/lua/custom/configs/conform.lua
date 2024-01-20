local present, conform = pcall(require, "conform")

if not present then
  return
end

conform.setup {
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
