local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

lspconfig.lemminx.setup {
	settings = {
		xml = {
			format = {
				joinCommentLines = true,
				maxLineWidth = 72,
				spaceBeforeEmptyCloseTag = true,
			},
		},
	},
	capabilities = capabilities
}

vim.api.nvim_create_augroup("lemminx", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = "lemminx",
	desc = "Format on Save",
    	pattern = "*.xml",
    	callback = function()
		vim.lsp.buf.format()
    	end,
})

-- Formatting settings
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

vim.cmd "LspStart"
