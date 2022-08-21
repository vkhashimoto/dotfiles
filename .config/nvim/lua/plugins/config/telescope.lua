local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git"
		},
		prompt_prefix = "-> ",
		selection_caret = "#> ",
		path_display = { "smart" },
		mappings = {
			i = {
				["jk"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-p>"] = action_layout.toggle_preview,
				-- show key mappings
				-- ["<C-?>"] = actions.which_key
			}
		}
	--	layout_config = {
	--		vertical = { width = 0.1 }
	--	}
	},
	pickers = {
		find_files = {
			hidden = true
		},
		live_grep = {
			additional_args = function (opts)
				-- search on hidden files
				return {"--hidden"}
			end
		}
	}
})
