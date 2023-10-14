-- TODO: Load ignore file based on filetype
local home_folder = os.getenv("HOME")
local dev_env_name = os.getenv("DEV_ENV_NAME")
local ignore_file = home_folder .. string.format("/.dev/%s/.ignore", dev_env_name)

require("telescope").setup {
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--ignore-file", ignore_file },
    		}
  	}
}
