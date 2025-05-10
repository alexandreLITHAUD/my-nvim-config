return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	config = function()
		require("Comment").setup()

		vim.keymap.set("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.current()
		end, { noremap = true, silent = true })

		-- Visual mode: toggle comment on selection
		vim.keymap.set("v", "<leader>/", function()
			-- Exit visual mode but preserve the selection
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, { noremap = true, silent = true })
	end,
}
