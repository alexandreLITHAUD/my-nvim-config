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
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
			},
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = true, -- show help message on the command line when the popup is visible
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specify a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
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
