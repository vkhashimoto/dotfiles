-- Vim script config available on: https://github.com/mikelue/vim-maven-plugin/blob/master/compiler/maven.vim
--TODO: This always returns nil
if vim.g.current_compiler then
	return
end
-- set the compiler name
vim.g.current_compiler = "maven"
-- command to run on :make
vim.opt_local.makeprg = [[mvn -B $*]]

-- error filter
--TODO: maven outputs duplicated errors (different goals)
vim.o.errorformat = table.concat(
	{
		--"%-G[INFO] %.%#",
		"%-G[debug] %.%#",
		"[%tARNING] %f:[%l\\,%c] %m",
		"[%tRROR] %f:[%l\\,%c] %m",

		-- Get info from list of failures
		"%+E%>[ERROR] Failures:",
		--"%+E%>[ERROR]   %.%\\+:%l %m",
		"%+E%>[ERROR]   %f%.%s:%l %m",
		"%+Z%[INFO] ",
		-- Get info from list of failures

		-- Get from stacktrace, but it's on the wrong class
		--"%+E%>[ERROR] %.%\\+Time elapsed:%.%\\+<<< FAILURE!",
		--"%+E%>[ERROR] %.%\\+Time elapsed:%.%\\+<<< ERROR!",
		--"%+Z%\\s%#at %f(%\\f%\\+:%l)",
		--"%+C%.%#",
		-- Get from stacktrace, but it's on the wrong class

		"%-G%.%#" -- Ignore lines that aren't matched by previous expressions
	},
	","
)
