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

			-- For waiting state (*)
			if status == "waiting" then
				return "󱙺 Searching..."

			-- For no suggestions (0)
			elseif status == "idle" then
				return " "

			-- For suggestions (x/y)
			elseif status == "completions" and status.total > 0 then
				return string.format("%d/%d", status.current, status.total)

			-- For no suggestions (0)
			else
				return "󱙷 No suggestions"
			end
		end

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
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					windsurf_status,
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
	end,
}
