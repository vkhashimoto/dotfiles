return {
	{
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function() require("plugins.lsp.manager.config.mason") end,
	},
}
