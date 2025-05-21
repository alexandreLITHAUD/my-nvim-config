return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run test file",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Open test output",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle test summary",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
				}),
			},
		})

		-- Create a group for Neotest keymaps
		local wk = require("which-key")

		-- Normal mode mappings
		wk.register({
			["<leader>t"] = {
				name = "Tests",
				["t"] = { "<cmd>lua require('neotest').run.run()<CR>", "Run nearest test" },
				["f"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run test file" },
				["o"] = { "<cmd>lua require('neotest').output.open({ enter = true })<CR>", "Open test output" },
				["s"] = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Toggle test summary" },
			},
		})
	end,
}
