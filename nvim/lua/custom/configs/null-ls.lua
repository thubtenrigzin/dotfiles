local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local formatting = b.formatting
-- local lint = b.diagnostics

local sources = {
  -- ts/js
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- html css
  formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,

  --lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
