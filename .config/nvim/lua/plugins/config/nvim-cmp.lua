local cmp = require('cmp')
local luasnip = require('luasnip')
local lspconfig = require('lspconfig')

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local existing_capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = require('cmp_nvim_lsp').update_capabilities(existing_capabilities),
})


print("CMP")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})


--local capabilities = require('nvim-jdtls').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--require('lspconfig')['nvim-jdtls'].setup({
--	capabilites = capabilities
--})
