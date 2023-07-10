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
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local workspace_dir = '/home/vkhashimoto/nvim-jdtls-workspace' .. project_name

local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = os.getenv("HOME") .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

--lspconfig.jdtls.setup {
--	capabilities = capabilities,
--}

vim.cmd "LspStart"

local config = {
	settings = {
		java = {
			format = {
				settings = {
					url = "<FORMATTER_FILE_PATH>"
				}
			},
		}
	},
	cmd = { 
		"jdtls",
		"-data", workspace_folder
	},
	root_dir = root_dir,
}

if config["settings"]["java"]["format"]["settings"]["url"] == "<FORMATTER_FILE_PATH>" then
	vim.notify("Java formatter file not set", vim.log.levels.WARN, {
		title = "Java DE"
	})
end


require("jdtls").start_or_attach(config)


