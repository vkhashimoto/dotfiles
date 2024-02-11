local pmap = require("core.keymap.utils").pmap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


pmap("n", "<leader>ha", mark.add_file, {})
pmap("n", "<leader>hf", ui.toggle_quick_menu, {})

