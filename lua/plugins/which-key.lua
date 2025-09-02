return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local which_key = require("which-key")
		which_key.setup({
			preset = "modern", -- Use modern preset which includes most sensible defaults
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = false,
					suggestions = 20,
				},
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			-- New replace option instead of key_labels
			replace = {
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
			},
			-- New win option instead of window
			win = {
				border = "single", -- none, single, double, shadow
				padding = { 0, 1, 0, 1 }, -- extra window padding [top, right, bottom, left]
				wo = {
					winblend = 0,
				},
			},
			layout = {
				height = { min = 4, max = 15 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			-- New filter option instead of ignore_missing
			filter = function(mapping)
				-- Return true to show the mapping
				return true
			end,
			show_help = true, -- show help message on the command line when the popup is visible
			-- New triggers format - must be a table
			triggers = {
				{ "<auto>", mode = "nxsot" },
			},
		})
		-- Add vim core custom keymaps
		which_key.add(require("keymaps.vim-core").keys)
		-- Add telescope custom keymaps
		which_key.add(require("keymaps.telescope").keys)
		-- Add comment custom keymaps
		which_key.add(require("keymaps.comment").keys)
		-- Add auto-completion custom keymaps
		which_key.add(require("keymaps.completion").keys)
		-- Add Neotree custom keymaps
		which_key.add(require("keymaps.neo-tree").keys)
		-- Add ToggleTerm custom keymaps
		which_key.add(require("keymaps.toggleterm").keys)
		-- Add LSP Config custom keymaps
		which_key.add(require("keymaps.lsp").lsp_keys)
		which_key.add(require("keymaps.lsp").tlsp_keys)
		-- Add Snippets custom keymaps
		which_key.add(require("keymaps.snippets").keys)
		-- Add TodoComments custom keymaps
		which_key.add(require("keymaps.todo-comments").keys)
		-- Add Noice custom keymaps
		which_key.add(require("keymaps.noice").keys)
		-- Add LazyGit custom keymaps
		which_key.add(require("keymaps.lazygit").keys)
		-- Add Sops custom keymaps
		which_key.add(require("keymaps.sops").keys)
		-- Add Gitsigns custom keymaps
		which_key.add(require("keymaps.gitsigns").keys())
		-- Add Harpoon custom keymaps
		which_key.add(require("keymaps.harpoon").keys())
	end,
}
