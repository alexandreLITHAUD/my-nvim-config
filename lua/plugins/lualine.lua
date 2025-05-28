return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function windsurf_status()
			-- Check if the module exists before trying to use it
			local ok, virtual_text = pcall(require, "codeium.virtual_text")
			if not ok then
				return ""
			end

			local status = virtual_text.status()

			-- For waiting state
			if status.state == "waiting" then
				return "󱙺 Searching..."

			-- For idle state (no active suggestions)
			elseif status.state == "idle" then
				return " "

			-- For when suggestions are available
			elseif status.state == "completions" then
				if status.total and status.total > 0 and status.current then
					return string.format("󱙸 %d/%d", status.current, status.total)
				else
					return "󱙷 No suggestions"
				end

			-- Fallback
			else
				return ""
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
						windsurf_status,
						color = function()
							local status = require("codeium.virtual_text").status()
							if status.state == "waiting" then
								return { fg = "#bd93f9" } -- Purple for waiting
							elseif status.state == "completions" and status.total and status.total > 0 then
								return { fg = "#50fa7b" } -- Green for suggestions
							elseif status.state == "completions" then
								return { fg = "#ff5555" } -- Red for no suggestions
							else
								return {} -- Default color
							end
						end,
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

		-- Set up the refresh callback to update lualine whenever Windsurf status changes
		local ok, virtual_text = pcall(require, "codeium.virtual_text")
		if ok then
			virtual_text.set_statusbar_refresh(function()
				require("lualine").refresh()
			end)
		end
	end,
}
