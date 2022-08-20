--vim.cmd([[ packadd packer.nvim ]])

local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
	return string.format('require("plugins/config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	print("Installing packer")
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.startup(function()
	use( 'wbthomason/packer.nvim' )
	use({ 
		"catppuccin/nvim", 
		as = "catppuccin" ,
		config = get_config("catppuccin"),
	})

	-- sync when opening nvim for the first time
	if packer_bootstrap then
		packer.sync()
	end
end)
