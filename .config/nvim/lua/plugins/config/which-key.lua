local wk = require("which-key")

wk.setup({
	plugins = {
		marks = false,
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
		},
	},
	operators = { gc = "Comments" },
	window = {
		border = "single",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 2,
		align = "center",
	}
})

-- register mappings with <leader>
wk.register({
	f = {
		name = "find",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		s = { "<cmd>Telescope live_grep<cr>", "Search string" },
		w = { "<cmd>Telescope grep_string<cr>", "Search current string" },
		m = { "<cmd>Telescope marks<cr>", "Find marks" },
		b = { "<cmd>Telescope file_browser path=%:p:h<cr>", "File Browser" },
	}

}, { prefix = "<leader>"} )
