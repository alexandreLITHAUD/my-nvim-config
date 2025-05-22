-- lua/keymaps/luasnip.lua
local M = {}

M.keys = {
	{ "<C-j>", desc = "Jump to next snippet", mode = { "i", "s" } },
	{ "<C-k>", desc = "Jump to previous snippet", mode = { "i", "s" } },
	{ "<leader>ss", ":Telescope luasnip<CR>", desc = "Search Snippets" },
}

return M
