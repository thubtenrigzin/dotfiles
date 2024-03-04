local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

local servers = { "cssls", "html", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  -- offset encoding warning https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

-- Emmet
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  filetypes = { "css", "html", "javascript", "sass", "scss", "vue" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
}

-- Json schemas
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    json = {
      schemas = require("schemastore").json.schemas {
        extra = {
          {
            description = "NPM configuration file",
            fileMatch = "package.json",
            name = "package.json",
            url = "file:///" .. vim.fn.stdpath "config" .. "\\lua\\custom\\schemastore\\package.json",
          },
          {
            description = "TypeScript compiler configuration file",
            fileMatch = { "tsconfig.json" },
            name = "tsconfig.json",
            url = "file:///" .. vim.fn.stdpath "config" .. "\\lua\\custom\\schemastore\\tsconfig.json",
          },
        },
      },
      validate = { enable = true },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  filetypes = { "python" },
}

-- Vue
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  filetypes = { "typescript", "javascript", "vue", "json" },
}
