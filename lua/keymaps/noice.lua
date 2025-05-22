-- lua/keymaps/noice.lua
local M = {}

M.keys = {
	-- Noice command mappings
	{ "<leader>nn", "<cmd>Noice<CR>", desc = "Toggle Noice UI" },
	{ "<leader>nl", "<cmd>Noice last<CR>", desc = "Show last message" },
	{ "<leader>nh", "<cmd>Noice history<CR>", desc = "Show message history" },
	{ "<leader>nd", "<cmd>Noice dismiss<CR>", desc = "Dismiss all messages" },
	{ "<leader>ne", "<cmd>Noice errors<CR>", desc = "Show error messages" },
	{ "<leader>nt", "<cmd>Noice telescope<CR>", desc = "Show messages in Telescope" },

	-- Scroll through LSP documentation
	{
		"<c-f>",
		function()
			if not require("noice.lsp").scroll(4) then
				return "<c-f>"
			end
		end,
		mode = { "n", "i", "s" },
		silent = true,
		expr = true,
		desc = "Scroll down in LSP documentation",
	},
	{
		"<c-b>",
		function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-b>"
			end
		end,
		mode = { "n", "i", "s" },
		silent = true,
		expr = true,
		desc = "Scroll up in LSP documentation",
	},
}

return M
