-- TODO: Load ignore file based on filetype
local home_folder = os.getenv("HOME")
local ignore_file = home_folder .. "/.dev/java/.ignore"

require("telescope").setup {
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--ignore-file", ignore_file },
    		}
  	}
}
