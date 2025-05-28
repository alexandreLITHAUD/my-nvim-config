return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		-- Main noice configuration
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = true,
				},
				signature = {
					enabled = true,
				},
			},
			-- FIXED: Disabled problematic presets
			presets = {
				bottom_search = false, -- CHANGED: was true, can interfere with key handling
				command_palette = false, -- CHANGED: was true, major cause of key timing issues
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				-- -- ADDED: Don't interfere with macro recording messages
				-- {
				-- 	filter = {
				-- 		event = "msg_show",
				-- 		find = "recording",
				-- 	},
				-- 	opts = { skip = true },
				-- },
				-- {
				-- 	filter = {
				-- 		event = "msg_show",
				-- 		find = "record",
				-- 	},
				-- 	opts = { skip = true },
				-- },
			},
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
		})
		-- Customize notify
		require("notify").setup({
			background_colour = "#000000",
			render = "minimal",
			stages = "fade",
			timeout = 3000,
		})
		-- Set up custom highlights for noice
		-- Try to get colors from your existing theme or config
		local colors
		local ok, existing_colors = pcall(require, "custom.colors")
		if ok then
			colors = existing_colors
		else
			-- Fallback colors if your custom colors module doesn't exist
			colors = {
				bg = "#1e222a",
				fg = "#abb2bf",
				yellow = "#e5c07b",
				cyan = "#56b6c2",
				darkblue = "#081633",
				green = "#98c379",
				orange = "#d19a66",
				violet = "#a9a1e1",
				magenta = "#c678dd",
				blue = "#61afef",
				red = "#e06c75",
			}
		end
		-- Define highlight groups
		local highlights = {
			NoiceCmdlinePopup = { bg = colors.bg, fg = colors.fg },
			NoiceCmdlinePopupBorder = { bg = colors.bg, fg = colors.blue },
			NoiceCmdlinePopupTitle = { bg = colors.bg, fg = colors.blue, bold = true },
			NoiceCmdlineIcon = { fg = colors.yellow },
			NoiceConfirm = { bg = colors.bg, fg = colors.fg },
			NoiceConfirmBorder = { bg = colors.bg, fg = colors.green },
			-- Message highlights
			NoiceMessageText = { fg = colors.fg },
			NoiceMessageTextError = { fg = colors.red },
			NoiceMessageTextWarning = { fg = colors.yellow },
			NoiceMessageTextInfo = { fg = colors.blue },
			-- Popupmenu highlights
			NoicePopupmenu = { bg = colors.bg },
			NoicePopupmenuBorder = { bg = colors.bg, fg = colors.blue },
			NoicePopupmenuMatch = { fg = colors.blue, bold = true },
			NoicePopupmenuSelected = { bg = colors.darkblue, bold = true },
		}
		-- Apply highlights
		for group, opts in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, opts)
		end
		-- Make sure telescope extension is loaded
		-- This assumes telescope is already set up in your config
		local telescope_ok, telescope = pcall(require, "telescope")
		if telescope_ok then
			telescope.load_extension("noice")
		end
	end,
}
