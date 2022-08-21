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
	-- themes
	use({ 
		"catppuccin/nvim", 
		as = "catppuccin" ,
		config = get_config("catppuccin"),
	})

	-- telescope
	use({
		'nvim-telescope/telescope.nvim',
		tag = "0.1.0",
		requires = { { 'nvim-lua/plenary.nvim'} },
		-- without this, telescope will not load on the first time
		after = 'plenary.nvim',
		config = get_config("telescope"),
	})
	use({
		'nvim-telescope/telescope-file-browser.nvim',
	})

	-- mappings
	use({
		"folke/which-key.nvim",
		config = get_config("which-key")
	})

	-- statuslines
	use({
		"nvim-lualine/lualine.nvim",
		requires = { { 'kyazdani42/nvim-web-devicons', opt = true } },
		config = get_config("lualine")
	})

	-- sync when opening nvim for the first time
	if packer_bootstrap then
		packer.sync()
	end
end)
