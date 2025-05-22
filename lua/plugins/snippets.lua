return {
	-- Enhanced snippet support
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Collection of snippets for many languages
		},
		config = function()
			local luasnip = require("luasnip")

			-- Load VSCode-style snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load custom snippets from your snippets directory
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

			require("keymaps.snippets").setup()

			-- Add your custom snippets here
			luasnip.add_snippets("all", {
				-- Available in all file types
				luasnip.snippet("date", {
					luasnip.function_node(function()
						return os.date("%Y-%m-%d")
					end),
				}),
			})

			-- Python snippets
			luasnip.add_snippets("python", {
				luasnip.snippet("ifmain", {
					luasnip.text_node({
						'if __name__ == "__main__":',
						"    ",
					}),
				}),
			})

			-- Golang snippets
			luasnip.add_snippets("go", {
				luasnip.snippet("errh", {
					luasnip.text_node({
						"if err != nil {",
						"    return err",
						"}",
					}),
				}),
			})
		end,
	},

	-- Optional: Snippet Explorer
	{
		"benfowler/telescope-luasnip.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("telescope").load_extension("luasnip")
		end,
	},
}
