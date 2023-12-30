-- import map function from `utils.lua`
local map = require("core.keymap.utils").map

-- define <leader>
vim.g.mapleader = " "

-- share system clipboard
vim.opt.clipboard = "unnamedplus"

map("i", "jk", "<ESC>")
map("i", "<ESC>", "<nop>")
map("t", "jk", "<C-\\><C-n>")
map("v", "<C-s>", [[:s/\%V\(\w*\)\s\(\w*\)/\2 \1<cr>]])
