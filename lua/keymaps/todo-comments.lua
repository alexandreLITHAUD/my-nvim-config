-- lua/keymaps/todo-comments.lua
local M = {}

M.keys = {
	{ "<leader>ts", ":TodoTelescope<CR>", desc = "Search todo comments" },
}

return M
