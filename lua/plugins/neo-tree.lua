return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<CR>"] = "open", -- current window
					["v"] = "open_split", -- horizontal split
					["s"] = "open_vsplit", -- vertical split
					["t"] = "open_tabnew", -- new tab
				},
			},
		})
		vim.keymap.set("n", "<leader>z", ":Neotree filesystem reveal left<CR>", {})
	end,
}
