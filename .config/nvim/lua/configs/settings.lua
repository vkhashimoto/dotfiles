vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set cursorline ]])

--TODO PackerCompile when changing any lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])



