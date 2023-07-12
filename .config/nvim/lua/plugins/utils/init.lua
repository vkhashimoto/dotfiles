return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.utils.config.treesitter")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.utils.config.indent-blankline")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugins.utils.config.harpoon")
		end,
	},
	{
		"ThePrimeagen/vim-be-good"
	},
}
