return {
	"zbirenbaum/copilot.lua",
	requires = {
		"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
	},
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false, -- Disable panel since you're using virtual text
				auto_refresh = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true, -- Equivalent to manual = false
				debounce = 75, -- Same as your idle_delay
				keymap = {
					accept = "<Tab>",
					accept_word = false,
					accept_line = false,
					next = "<C-s>",
					prev = "<C-q>",
					dismiss = "<C-]>", -- Clear/dismiss suggestions
				},
			},
			filetypes = {
				["."] = true, -- Enable for all other filetypes by default
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
