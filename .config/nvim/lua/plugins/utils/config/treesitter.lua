local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = { "java", "lua", "sql" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true }
}
