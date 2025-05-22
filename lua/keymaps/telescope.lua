local M = {}

M.keys = {
	{ "<leader>f", group = "find" },
	{ "<leader>fa", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
}

return M
