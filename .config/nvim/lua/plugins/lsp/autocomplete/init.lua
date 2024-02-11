return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("plugins.lsp.autocomplete.config.snippets")
				end,
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins.lsp.autocomplete.config")
		end,
	},
}
