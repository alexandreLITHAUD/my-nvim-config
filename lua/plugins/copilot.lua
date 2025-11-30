return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				auto_refresh = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = false, -- Disable default Tab mapping
					accept_word = false,
					accept_line = false,
					next = "<C-s>",
					prev = "<C-q>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				["*"] = true,
			},
			copilot_node_command = "node",
			server_opts_overrides = {},
		})

		-- Custom Tab keybinding: accept Copilot or insert tab
		vim.keymap.set("i", "<Tab>", function()
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			end
		end, { desc = "Accept Copilot suggestion or insert tab" })
	end,
}
