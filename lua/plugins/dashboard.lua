return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local logo = {
			"   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			"   ████╗  ██║██║   ██║██║████╗ ████║",
			"   ██╔██╗ ██║██║   ██║██║██╔████╔██║",
			"   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
		}

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = logo,
				center = {
					{ icon = "  ", desc = "New File", action = "ene | startinsert", key = "n" },
					{ icon = "  ", desc = "Find File", action = "Telescope find_files", key = "f" },
					{ icon = "  ", desc = "Recent Files", action = "Telescope oldfiles", key = "r" },
					{ icon = "  ", desc = "Find Word", action = "Telescope live_grep", key = "g" },
					{ icon = "  ", desc = "Edit Config", action = "edit ~/.config/nvim/init.lua", key = "c" },
					{ icon = "  ", desc = "Quit", action = "qa", key = "q" },
				},
				footer = function()
					local fortune = {
						"✨ Neovim > VSCode ✨",
						"🚀 Ready to build something cool!",
						"💡 Tip: Use <leader>tt to run tests!",
						"🐢 Slow and steady... or not. Let's go!",
					}
					math.randomseed(os.time())
					return { fortune[math.random(#fortune)] }
				end,
			},
		})
	end,
}
