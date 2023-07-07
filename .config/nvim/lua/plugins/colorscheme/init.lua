return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() require("plugins.colorscheme.config.catppuccin") end, },
	{ "folke/tokyonight.nvim", name = "tokyonight", priority = 1000, config = function() require("plugins.colorscheme.config.tokyonight") end, },
}
