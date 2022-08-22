local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/testuser/java-workspace' .. project_name

local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }
--local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
--    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  capabilities = capabilities,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/opt/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    --'-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '/opt/jdtls/config_linux',
    --'-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- See `data directory configuration` section in the README
    '-data', workspace_dir,
    --'-data', '/path/to/unique/per/project/workspace/folder'
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
	'/home/testuser/Downloads/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.39.0.jar',
	--'/home/testuser/Downloads/vscode-java-test/server/com.microsoft.java.test.plugin-0.36.0.jar',
	'/home/testuser/Downloads/vscode-java-test/server/com.microsoft.java.test.plugin-0.36.0.jar',
	--'/home/testuser/Downloads/vscode-java-test/java-extension/com.microsoft.java.test.runner/target/*.jar',
	'/home/testuser/Downloads/vscode-java-test/server/com.microsoft.java.test.runner-jar-with-dependencies.jar',
	--'/home/testuser/Downloads/vscode-java-test/java-extension/com.microsoft.java.test.runner/target/com.microsoft.java.test.runner-jar-with-dependencies.jar',
	'/home/testuser/Downloads/vscode-java-test/server/org.eclipse.jdt.junit4.runtime_1.2.0.v20210326-1251.jar',
	'/home/testuser/Downloads/vscode-java-test/server/org.eclipse.jdt.junit5.runtime_1.0.1300.v20210320-1132.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.jupiter.api_5.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.jupiter.engine_5.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.jupiter.migrationsupport_5.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.jupiter.params_5.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.vintage.engine_5.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.opentest4j_1.2.0.v20190826-0900.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.platform.commons_1.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.platform.engine_1.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.platform.launcher_1.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.platform.runner_1.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.junit.platform.suite.api_1.7.1.v20210222-1948.jar',
      	'/home/testuser/Downloads/vscode-java-test/server/org.apiguardian_1.1.0.v20190826-0900.jar'
    },
    --extendedClientCapabilities = extendedClientCapabilities
  },
}

config['on_attach'] = function(client, bufnr)
	require('jdtls').setup_dap({ 
		--hotcodereplace = 'auto' 
	})
end
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
