local M = {}

-- mode: vim mode
-- lhs : new keybind
-- rhs : existing keybind
-- opts: additional options. `:h map-arguments`
function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- mode			: vim mode
-- lhs 			: new keybind
-- plugin_function 	: plugin function to call
-- opts			: additional options. `:h map-arguments`
function M.pmap(mode, lhs, plugin_function, opts)
	vim.keymap.set(mode, lhs, plugin_function, opts)
end


return M
