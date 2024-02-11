require("telescope").setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown{},
			specific_opts = {
				codeactions = true
			}
		}
	}
}


require("telescope").load_extension("ui-select")
