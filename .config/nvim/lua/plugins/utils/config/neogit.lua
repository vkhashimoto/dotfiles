local neogit = require('neogit')
local pmap = require("core.keymap.utils").pmap

neogit.setup {}
pmap("n", "<leader>dg", neogit.open, {})
