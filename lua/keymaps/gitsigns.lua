local M = {}

M.keys = function(bufnr)
	local gitsigns = require("gitsigns")

	return {
		-- Actions
		{ "<leader>v", group = "Gitsigns actions" },
		{ "<leader>vs", gitsigns.stage_hunk, desc = "Stage hunk", buffer = bufnr },
		{ "<leader>vr", gitsigns.reset_hunk, desc = "Reset hunk", buffer = bufnr },
		{
			"<leader>vs",
			function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "Stage selected hunk",
			mode = "v",
			buffer = bufnr,
		},
		{
			"<leader>vr",
			function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "Reset selected hunk",
			mode = "v",
			buffer = bufnr,
		},
		{ "<leader>vS", gitsigns.stage_buffer, desc = "Stage buffer", buffer = bufnr },
		{ "<leader>vu", gitsigns.undo_stage_hunk, desc = "Undo stage hunk", buffer = bufnr },
		{ "<leader>vR", gitsigns.reset_buffer, desc = "Reset buffer", buffer = bufnr },
		{ "<leader>vp", gitsigns.preview_hunk, desc = "Preview hunk", buffer = bufnr },
		{
			"<leader>vb",
			function()
				gitsigns.blame_line({ full = true })
			end,
			desc = "Blame line",
			buffer = bufnr,
		},
		{ "<leader>vd", gitsigns.diffthis, desc = "Diff this", buffer = bufnr },
		{
			"<leader>vD",
			function()
				gitsigns.diffthis("~")
			end,
			desc = "Diff this ~",
			buffer = bufnr,
		},
	}
end

return M
