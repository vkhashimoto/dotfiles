local default_opts = { noremap = true }

require("configs/settings")
require("plugins/plugins")


-- remaps --
vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jk", "<esc>", default_opts)
-- disable arrow keys
vim.api.nvim_set_keymap("i", "<Left>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("i", "<Down>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("i", "<Up>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("i", "<Right>", "<Nop>", default_opts)

vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", default_opts)

vim.api.nvim_set_keymap("v", "<Left>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("v", "<Down>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("v", "<Up>", "<Nop>", default_opts)
vim.api.nvim_set_keymap("v", "<Right>", "<Nop>", default_opts)

