return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	config = function()
		require("Comment").setup()
		require("keymaps.comment").setup()
	end,
}
