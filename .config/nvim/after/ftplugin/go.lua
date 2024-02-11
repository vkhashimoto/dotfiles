local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)


local go = require("go")
local pmap = require("core.keymap.utils").pmap

pmap("n", "<leader>df", require("go.format").gofmt, {})
pmap("n", "<leader>dd", vim.lsp.buf.definition, {})
pmap("n", "<leader>dr", vim.lsp.buf.references, {})
pmap("n", "<leader>da", vim.lsp.buf.code_action, {})


go.setup()
lspconfig.gopls.setup {
	capabilities = capabilities
}

vim.cmd "LspStart"
