local configs = require "nvchad.configs.lspconfig"

local lspconfig = require "lspconfig"

local on_init = configs.on_init
local capabilities = configs.capabilities
local on_attach = function(client, bufnr) -- see configs.lspconfig.lua for the NvChad keymaps
  require("nvchad.configs.lspconfig").on_attach(client, bufnr) -- base NvChad config

  local map = vim.keymap.set
  local unmap = vim.keymap.del

  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  -- Unmap NvChad keymaps
  unmap("n", "gD", opts())
  unmap("n", "gd", opts())
  unmap("n", "gi", opts())
  unmap("n", "gr", opts())
  unmap("n", "<leader>sh", opts())
  unmap("n", "<leader>wa", opts())
  unmap("n", "<leader>wr", opts())
  unmap("n", "<leader>wl", opts())
  unmap("n", "<leader>D", opts())
  unmap("n", "<leader>ra", opts())
  unmap({ "n", "v" }, "<leader>ca", opts())

  -- map custom keymaps
  map("n", "<leader>lD", vim.lsp.buf.declaration, opts "LSP Go to declaration")
  map("n", "<leader>ls", vim.lsp.buf.signature_help, opts "LSP Show signature help")
  map("n", "<leader>lF", function()
    vim.lsp.buf.format { async = true }
  end, opts "LSP formatting")

  -- workspace
  map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts "LSP Add workspace folder")
  map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts "LSP Remove workspace folder")
  map("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  -- conform
  map({ "n", "v" }, "<leader>lf", function()
    require("conform").format { async = true, lsp_fallback = true }
  end, opts "LSP Formatting with conform")

  -- codeaction
  map("n", "<leader>la", "<cmd> CodeActionMenu <CR>", opts "LSP Code action")

  -- trouble
  map("n", "<leader>lr", "<cmd> TroubleToggle lsp_references <CR>", opts "LSP References")
  map("n", "<leader>li", "<cmd> TroubleToggle lsp_implementations <CR>", opts "LSP Implementation")
  map("n", "<leader>lxx", "<cmd> TroubleToggle document_diagnostics <CR>", opts "LSP Document Diagnostics")
  map("n", "<leader>lwx", "<cmd> TroubleToggle workspace_diagnostics <CR>", opts "LSP Workspace Diagnostics")

  map("n", "<leader>lo", "<cmd> TroubleToggle loclist <CR>", opts "Loclist Show list")
  map("n", "<leader>lq", "<cmd> TroubleToggle quickfix <CR>", opts "Quickfix Show list")

  -- togglelspdiagunderline
  map(
    "n",
    "<F12>",
    "<Plug>(toggle-lsp-diag-underline) <Plug>(toggle-lsp-diag-vtext) <Esc>hh",
    opts "Toggle the diagnostics"
  )

  -- lspsaga
  map("n", "<leader>ld", "<cmd> Lspsaga goto_definition <CR>", opts "LSP Definition")
  map("n", "<leader>lpd", "<cmd> Lspsaga peek_definition <CR>", opts "LSP preview definition")

  map("n", "<leader>lt", "<cmd> Lspsaga goto_type_definition <CR>", opts "LSP Definition")
  map("n", "<leader>lpt", "<cmd> Lspsaga peek_type_definition <CR>", opts "LSP preview type definition")

  map("n", "<F2>", "<cmd> Lspsaga rename <CR>", opts "LSP rename")

  map("n", "K", "<cmd> Lspsaga hover_doc <CR>", opts "Hover documentation")

  map("n", "[x", "<cmd> Lspsaga diagnostic_jump_prev <CR>", opts "LSP previous diagnostic")
  map("n", "]x", "<cmd> Lspsaga diagnostic_jump_next <CR>", opts "LSP next diagnostic")
  map("n", "<leader>lxj", "<cmd> Lspsaga show_line_diagnostics <CR>", opts "LSP line diagnostic")
  map("n", "<leader>lxk", "<cmd> Lspsaga show_cursor_diagnostics <CR>", opts "LSP cursor diagnostic")

  -- linter
  map("n", "<leader>ll", function()
    require("lint").try_lint()
  end, opts "Linter Lint the current file")
end

local servers = { "cssls", "html", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lua
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

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
            url = "file:///" .. vim.fn.stdpath "config" .. "\\lua\\schemastore\\package.json",
          },
          {
            description = "TypeScript compiler configuration file",
            fileMatch = { "tsconfig.json" },
            name = "tsconfig.json",
            url = "file:///" .. vim.fn.stdpath "config" .. "\\lua\\schemastore\\tsconfig.json",
          },
        },
      },
      validate = { enable = true },
    },
  },
}

-- Python
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
