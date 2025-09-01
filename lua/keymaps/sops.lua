-- lua/keymaps/sops.lua
local M = {}

M.keys = {
	{
		{ "<leader>d", group = "Sops actions" },
		{ "<leader>de", vim.cmd.SopsEncrypt, desc = "[E]ncrypt [F]ile" },
		{ "<leader>dd", vim.cmd.SopsDecrypt, desc = "[D]ecrypt [F]ile" },
	},
}

return M
