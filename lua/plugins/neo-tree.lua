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
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".git",
						".DS_Store",
						"thumbs.db",
					},
				},
			},
		})
	end,
}
