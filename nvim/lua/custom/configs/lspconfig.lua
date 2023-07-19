local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "clangd", "tsserver", "pyright", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- clangd
--
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  -- offset encoding warning https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  }
}


-- 
-- lspconfig.pyright.setup { }
