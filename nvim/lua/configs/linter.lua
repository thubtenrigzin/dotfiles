local present, lint = pcall(require, "lint")

if not present then
  return
end

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  pattern = { "*.py", "*.js", "*.ts", "*.lua" },
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

lint.linters_by_ft = {
  lua = {
    "luacheck",
  },
  javascript = { "eslint_d" },
  python = { "pylint", "ruff" },
  typescript = { "eslint_d" },
}
