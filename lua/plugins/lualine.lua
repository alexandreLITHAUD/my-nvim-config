return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function copilot_status()
			-- Check if copilot is available
			local ok, copilot_api = pcall(require, "copilot.api")
			if not ok then
				return ""
			end

			-- Get copilot status
			local status = copilot_api.status.data

			-- Handle different states
			if status.status == "InProgress" then
				return "󱙺 Thinking..."
			elseif status.status == "Normal" then
				-- Check if there are active suggestions
				local suggestion_ok, suggestion = pcall(require, "copilot.suggestion")
				if suggestion_ok and suggestion.is_visible() then
					return "󱙸 Ready"
				else
					return " "
				end
			elseif status.status == "Warning" then
				return "󱙷 Warning"
			elseif status.status == "Error" then
				return " Error"
			else
				return ""
			end
		end

		local function copilot_color()
			local ok, copilot_api = pcall(require, "copilot.api")
			if not ok then
				return {}
			end

			local status = copilot_api.status.data

			if status.status == "InProgress" then
				return { fg = "#bd93f9" } -- Purple for thinking
			elseif status.status == "Normal" then
				local suggestion_ok, suggestion = pcall(require, "copilot.suggestion")
				if suggestion_ok and suggestion.is_visible() then
					return { fg = "#50fa7b" } -- Green for suggestions available
				else
					return {} -- Default color when idle
				end
			elseif status.status == "Warning" then
				return { fg = "#ffb86c" } -- Orange for warning
			elseif status.status == "Error" then
				return { fg = "#ff5555" } -- Red for error
			else
				return {}
			end
		end

		-- Set up lualine configuration
		require("lualine").setup({
			options = {
				theme = "dracula",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{
						copilot_status,
						color = copilot_color,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})

		-- Set up auto-refresh for copilot status changes using autocmds
		vim.api.nvim_create_autocmd("User", {
			pattern = "CopilotStatusChanged",
			callback = function()
				require("lualine").refresh()
			end,
		})

		-- Also refresh on insert mode changes to catch suggestion visibility changes
		vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "CursorMovedI" }, {
			callback = function()
				require("lualine").refresh()
			end,
		})
	end,
}
