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

local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = os.getenv("HOME") .. "/.local/share/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)


local settings = {
	java = {
		format = {
			settings = {
				url = "<FORMATTER_FILE_PATH>"
			}
		},
	}
}
local config = {
	cmd = { 
	    'java',
	    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
	    '-Dosgi.bundles.defaultStartLevel=4',
	    '-Declipse.product=org.eclipse.jdt.ls.core.product',
	    '-Dlog.protocol=true',
	    '-Dlog.level=ALL',
	    '-Xmx1g',
	    '--add-modules=ALL-SYSTEM',
	    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
	    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
	    '-jar', '<JDTLS_ECLIPSE_EQUINOX_LAUNCHER>',
	    '-configuration', '<JDTLS_CONFIG_FOLDER>',
	    '-data', workspace_folder,
	},
	settings = settings,
	root_dir = root_dir,
}

if config["settings"]["java"]["format"]["settings"]["url"] == "<FORMATTER_FILE_PATH>" then
	vim.notify("Java formatter file not set", vim.log.levels.WARN, {
		title = "Java DE"
	})
end

--TODO: Create a method to notify error and group by "notification_type"
local error = false
for key, value in pairs(config.cmd) do
	if value == "<JDTLS_ECLIPSE_EQUINOX_LAUNCHER>" then
		vim.notify("jdtls eclipse equinox launcher not set", vim.log.levels.ERROR, {
			title = "Java DE"
		})
		error = true
	end

	if value == "<JDTLS_CONFIG_FOLDER>" then
		vim.notify("jdtls config folder not set", vim.log.levels.ERROR, {
			title = "Java DE"
		})
	error = true
	end
end

if error then
	return
end

require("jdtls").start_or_attach(config)


