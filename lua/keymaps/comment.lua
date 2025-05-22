-- lua/keymaps/comment.lua
local M = {}

M.setup = function()
	-- Normal mode comment toggle
	vim.keymap.set("n", "<leader>/", function()
		require("Comment.api").toggle.linewise.current()
	end, { noremap = true, silent = true, desc = "Toggle comment" })

	-- Visual mode comment toggle
	vim.keymap.set("v", "<leader>/", function()
		-- Exit visual mode but preserve the selection
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		vim.api.nvim_feedkeys(esc, "nx", false)
		require("Comment.api").toggle.linewise(vim.fn.visualmode())
	end, { noremap = true, silent = true, desc = "Toggle comment" })
end

M.keys = {
	{ "<leader>/", desc = "Toggle comment", mode = { "n", "v" } },
}

return M
