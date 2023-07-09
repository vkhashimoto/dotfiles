local pmap = require("core.keymap.utils").pmap
local map = require("core.keymap.utils").map
local ls = require("luasnip")


-- snippets nodes
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
-- config
ls.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
}

pmap({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true})

pmap({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

pmap({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true})

-- reload this config
map("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/lsp/autocomplete/config/snippets/init.lua<CR>")

-- useful when reloading snippets
ls.cleanup()
ls.add_snippets("all", {
	s("expand", { t("-- this is what was expanded") }),
	s("expandv", {
		t({ "Cursor is here ->"}), i(1),
		t({ "", "After jumping once, the cursor is here ->"}), i(2),
		t({ "", "After jumping twice, the cursor is here ->"}), i(0),
	})
})


