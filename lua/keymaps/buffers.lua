-- lua/keymaps/buffers.lua
local M = {}

M.keys = {
	{ "<leader>b", group = "buffers" },

	-- Quick switch to alternate buffer (replaces :e#)
	{ "<leader><leader>", "<cmd>b#<cr>", desc = "Switch to last buffer" },
	-- or use Tab if you prefer
	-- { "<Tab>", "<cmd>b#<cr>", desc = "Switch to last buffer" },

	-- Navigate through buffer list
	{ "[b", "<cmd>bprevious<cr>", desc = "Previous buffer" },
	{ "]b", "<cmd>bnext<cr>", desc = "Next buffer" },

	-- Buffer management with Telescope (best UX!)
	{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "List buffers" },
	{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
	{ "<leader>bD", "<cmd>%bd|e#|bd#<cr>", desc = "Delete all but current" },

	-- Close buffer without closing window
	{ "<leader>bx", "<cmd>bp|bd #<cr>", desc = "Close buffer (keep window)" },
}

return M
