-- lua/keymaps/luasnip.lua
local M = {}

M.setup = function()
	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if require("luasnip").jumpable(1) then
			require("luasnip").jump(1)
		end
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		if require("luasnip").jumpable(-1) then
			require("luasnip").jump(-1)
		end
	end, { silent = true })
end

M.keys = {
	{ "<C-j>", desc = "Jump to next snippet", mode = { "i", "s" } },
	{ "<C-k>", desc = "Jump to previous snippet", mode = { "i", "s" } },
	{ "<leader>ss", ":Telescope luasnip<CR>", desc = "Search Snippets" },
}

return M
