local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
local pmap = require("core.keymap.utils").pmap

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

lspconfig.rust_analyzer.setup{
	capabilities = capabilities,
	cmd = { "rustup", "run", "stable", "rust-analyzer" }
}

pmap("n", "<leader>df", vim.lsp.buf.format, {})
pmap("n", "<leader>da", vim.lsp.buf.code_action, {})
pmap("n", "<leader>dd", vim.lsp.buf.definition, {})
pmap("n", "<leader>dr", vim.lsp.buf.references, {})

vim.cmd "LspStart"
