local M = {}


-- Adds new folder to the LSP workspace (used with jdtls)
-- new_project_folder: folder to be added to lsp workspace
-- TODO: Get relative path
M.load_workspace = function(new_project_folder)
	vim.lsp.buf.add_workspace_folder(new_project_folder)
end

return M
