return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shade_terminals = false,
			float_opts = {
				border = "single",
				winblend = 0,
			},
		})
	end,
}
