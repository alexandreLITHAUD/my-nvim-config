-- lua/keymaps/lsp.lua
local M = {}

M.lsp_keys = {
	{ "<leader>l", group = "lsp" },
	{ "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol" },
	{ "<leader>la", vim.lsp.buf.code_action, desc = "Code actions" },
	{ "<leader>lk", vim.lsp.buf.hover, desc = "Hover" },
	{ "<leader>le", vim.diagnostic.open_float, desc = "Show diagnostics" },
	{ "<leader>lt", vim.lsp.buf.type_definition, desc = "Type definition" },
}

M.tlsp_keys = {
	{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
	{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
	{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
	{ "gs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Go to document symbols" },
	{ "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Go to workspace symbols" },
}

return M
