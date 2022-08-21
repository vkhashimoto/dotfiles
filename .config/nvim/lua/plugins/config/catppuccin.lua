-- catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup({
	styles = {
		comments = { "italic" },
	},
	--TODO Check if this is needed
	--integrations = {
	--	telescope = true
	--}
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd([[ colorscheme catppuccin ]])
