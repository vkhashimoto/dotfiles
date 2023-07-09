return {
	{
	    "williamboman/mason.nvim",
	    --dependencies = {
	    --    "neovim/nvim-lspconfig"
	    --},
	    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	    config = function() require("plugins.lsp.manager.config.mason") end,
	},
}
