-- catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup({
	styles = {
		comments = { "italic" },
	}
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd([[ colorscheme catppuccin ]])
