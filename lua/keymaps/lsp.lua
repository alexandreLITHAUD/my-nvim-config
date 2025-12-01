-- lua/keymaps/lsp.lua
local M = {}

M.lsp_keys = {
	{ "<leader>c", group = "lsp" },

	-- Navigation
	{ "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
	{ "<leader>cD", vim.lsp.buf.declaration, desc = "Go to declaration" },
	{ "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
	{ "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
	{ "<leader>ct", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to type definition" },

	-- Symbols
	{ "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
	{ "<leader>cS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },

	-- Diagnostics
	{ "<leader>ce", vim.diagnostic.open_float, desc = "Show line diagnostics" },
	{ "<leader>cw", "<cmd>Telescope diagnostics<cr>", desc = "All diagnostics" },
	{ "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
	{ "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },

	-- Code actions & refactoring
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
	{ "<leader>cn", vim.lsp.buf.rename, desc = "Rename symbol" },
	{ "<leader>cf", vim.lsp.buf.format, desc = "Format document" },

	-- Information
	{ "<leader>ck", vim.lsp.buf.hover, desc = "Hover documentation" },
	{ "<leader>cg", vim.lsp.buf.signature_help, desc = "Signature help" },
}

-- M.tlsp_keys = {
-- 	{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
-- 	{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
-- 	{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
-- 	{ "gs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Go to document symbols" },
-- 	{ "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Go to workspace symbols" },
-- }

return M
