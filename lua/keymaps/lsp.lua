-- lua/keymaps/lsp.lua
local M = {}

M.lsp_keys = {
	{ "<leader>c", group = "lsp" },
	{ "<leader>cd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename symbol" },
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
	{ "<leader>ck", vim.lsp.buf.hover, desc = "Hover" },
	{ "<leader>ce", vim.diagnostic.open_float, desc = "Show diagnostics" },
	{ "<leader>ct", vim.lsp.buf.type_definition, desc = "Type definition" },
}

M.tlsp_keys = {
	{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
	{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
	{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
	{ "gs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Go to document symbols" },
	{ "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Go to workspace symbols" },
}

return M
