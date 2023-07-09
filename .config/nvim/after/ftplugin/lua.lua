-- TODO: Check if lspconfig and lua_ls are installed

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)
require'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Attach buffer to the LSP server
vim.cmd "LspStart"
