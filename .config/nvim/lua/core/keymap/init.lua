-- import map function from `utils.lua`
local map = require("core.keymap.utils").map

-- define <leader>
vim.g.mapleader = " "

map("i", "jk", "<ESC>")
map("i", "<ESC>", "<nop>")
