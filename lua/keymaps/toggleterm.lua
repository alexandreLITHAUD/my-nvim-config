-- lua/keymaps/toggleterm.lua
local M = {}

M.keys = {
	{ "<leader>tt", ":ToggleTerm<CR>", desc = "Toggle Terminal" },
	{ "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Float Terminal" },
	{ "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Horizontal Terminal" },
	{ "<leader>tv", ":ToggleTerm direction=vertical size=50<CR>", desc = "Vertical Terminal" },
	{ "<leader>tb", ":ToggleTerm direction=tab<CR>", desc = "Tab Terminal" },
	-- Multiple terminals
	{ "<leader>t1", ":1ToggleTerm<CR>", desc = "Terminal 1" },
	{ "<leader>t2", ":2ToggleTerm<CR>", desc = "Terminal 2" },
	{ "<leader>t3", ":3ToggleTerm<CR>", desc = "Terminal 3" },
}

return M
