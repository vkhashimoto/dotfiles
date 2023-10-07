return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
      		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() 
			require("plugins.telescope.config.keymap")
			require("plugins.telescope.config.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("plugins.telescope.config.telescope-ui-select")
		end,
	}
}
