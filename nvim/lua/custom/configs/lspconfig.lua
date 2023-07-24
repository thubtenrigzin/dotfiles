local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local schemas = require('schemastore').json.schemas

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "pyright", "gopls", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

--
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
-- Json schemas
--
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = schemas {
        select = {
          "package.json",
          "tsconfig.json",
        },
      },
      validate = { enable = true },
    },
  },
}
