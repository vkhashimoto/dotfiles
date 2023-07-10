vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
--vim.opt.listchars:append "tab:>-"
require("indent_blankline").setup {
	-- TODO: Use treesitter to indent
	--use_treesitter_scope = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}
