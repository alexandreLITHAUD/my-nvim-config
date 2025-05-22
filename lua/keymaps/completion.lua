-- lua/keymaps/cmp.lua
local M = {}

M.setup = function()
	vim.keymap.set("n", "<C-Space>", function()
		vim.api.nvim_feedkeys("a", "n", false) -- enter insert mode (append)
		vim.schedule(function()
			require("cmp").complete()
		end)
	end, { desc = "Enter insert mode and trigger completion" })
end

M.keys = {
	{ "<C-Space>", desc = "Enter insert mode and trigger completion", mode = "n" },
}

return M
