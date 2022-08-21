require('lualine').setup({
	options = {
		icons_enabled = false,
		component_separators = '',
		section_separators = ''
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding' },
		lualine_y = { 'filetype', },
		lualine_z = {},
	},
	tabline = {
		lualine_a = { 'buffers' }
	}
})
