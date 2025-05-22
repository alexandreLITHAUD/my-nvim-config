-- lua/keymaps/vim-core.lua
local M = {}

M.keys = {
	-- Window navigation group
	{ "<leader>s", group = "window navigation" },
	{ "<C-h>", "<C-w>h", desc = "Move to left window" },
	{ "<C-j>", "<C-w>j", desc = "Move to bottom window" },
	{ "<C-k>", "<C-w>k", desc = "Move to top window" },
	{ "<C-l>", "<C-w>l", desc = "Move to right window" },

	-- Window navigation with leader + arrow keys
	{ "<leader>s<Left>", "<C-w>h", desc = "Move to left window" },
	{ "<leader>s<Down>", "<C-w>j", desc = "Move to bottom window" },
	{ "<leader>s<Up>", "<C-w>k", desc = "Move to top window" },
	{ "<leader>s<Right>", "<C-w>l", desc = "Move to right window" },

	-- Window navigation with leader + hjkl
	{ "<leader>h", "<C-w>h", desc = "Move to left window" },
	{ "<leader>j", "<C-w>j", desc = "Move to bottom window" },
	{ "<leader>k", "<C-w>k", desc = "Move to top window" },
	{ "<leader>l", "<C-w>l", desc = "Move to right window" },

	-- Resize windows
	{ "<leader>r", group = "resize windows" },
	{ "<leader>r<Up>", ":resize +5<CR>", desc = "Increase height" },
	{ "<leader>r<Down>", ":resize -5<CR>", desc = "Decrease height" },
	{ "<leader>r<Right>", ":vertical resize +5<CR>", desc = "Increase width" },
	{ "<leader>r<Left>", ":vertical resize -5<CR>", desc = "Decrease width" },

	-- Clipboard operations
	{ "<C-c>", '"+y', desc = "Copy to clipboard", mode = "v" },
	{ "<leader>y", '"+y', desc = "Copy to clipboard", mode = "v" },
	{ "<C-a>", "gg0vG$", desc = "Select all", mode = { "n", "v" } },
}

return M
