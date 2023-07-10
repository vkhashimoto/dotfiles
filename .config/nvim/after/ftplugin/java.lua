-- snippets TODO: Move to another file?
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("java", {
	s("main", {
		t({ "public static void main(String args[]) {" }),
		t({ "", "	" }), i(0),
		t({ "", "}" }),
	}),
	s("mainp", {
		t({ "public static void main(String args[]) {" }),
		t({ "", [[	System.out.println("]] }), i(0),
		t({ [[");]] }),
		t({ "", "}" }),

	}),
	s("mainf", {
		t({ "public static void main(String args[]) {" }),
		t({ "", "	System.out.println(" }), i(0),
		t({ ");" }),
		t({ "", "}" }),
	});
	s("print", {
		t({ [[System.out.println("]] }), i(0),
		t({ [[");]] }),
	}),
	s("printv", {
		t({ "System.out.println(" }), i(0),
		t({ ");" }),
	}),
	s("today", {
		t({ "LocalDate today = LocalDate.today();" }),
		t({ "", "" }), i(0),
	}),
	s("now", {
		t({ "LocalDateTime now = LocalDateTime.now();" }),
		t({ "", "" }), i(0),
	})
})


local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

lspconfig.jdtls.setup {
	capabilities = capabilities,
}

vim.cmd "LspStart"

local config = {
	settings = {
		java = {
			format = {
				settings = {
					url = "<FORMATTER_FILE_PATH>"
				}
			}
		}
	},
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw"}, { upward = true })[1]),
}

if config["settings"]["java"]["format"]["settings"]["url"] == "<FORMATTER_FILE_PATH>" then
	vim.notify("Java formatter file not set", vim.log.levels.WARN, {
		title = "Java DE"
	})
end


require("jdtls").start_or_attach(config)
