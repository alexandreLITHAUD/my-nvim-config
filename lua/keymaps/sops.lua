-- lua/keymaps/sops.lua
local M = {}

M.keys = {
	{
		{ "<leader>ee", vim.cmd.SopsEncrypt, desc = "[E]ncrypt [F]ile" },
		{ "<leader>ed", vim.cmd.SopsDecrypt, desc = "[D]ecrypt [F]ile" },
	},
}

return M
