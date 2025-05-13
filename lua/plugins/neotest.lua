return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Add your language-specific adapter here:
		"nvim-neotest/neotest-go",
		-- Add more: "nvim-neotest/neotest-python", "rouge8/neotest-rust", etc.
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
				-- Add more adapters here if needed
			},
		})
	end,
}
