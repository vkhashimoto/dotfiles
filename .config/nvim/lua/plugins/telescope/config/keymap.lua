local pmap = require("core.keymap.utils").pmap
local builtin = require("telescope.builtin")


pmap("n", "<leader>ff", builtin.find_files, {})
pmap("n", "<leader>fh", builtin.live_grep, {})
