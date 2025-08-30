local M = {}

M.keys = {
	{ "<leader>a", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
}

return M
