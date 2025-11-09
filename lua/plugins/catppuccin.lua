return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
        flavour = "mocha", -- keep mocha but enhance it
        transparent_background = true, 
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic", "bold" },
          loops = { "bold" },
          functions = { "bold" },
          keywords = { "italic" },
          strings = { "italic" },
          variables = {},
          numbers = { "bold" },
          booleans = { "bold" },
          properties = {},
          types = { "bold" },
          operators = {},
        },
        color_overrides = {},
        custom_highlights = function(colors)
          return {
            ["@function"] = { fg = colors.blue, style = { "bold" } },
            ["@function.call"] = { fg = colors.blue, style = { "bold" } },
            ["@keyword"] = { fg = colors.mauve, style = { "italic", "bold" } },
            ["@string"] = { fg = colors.green, style = { "italic" } },
            ["@type"] = { fg = colors.yellow, style = { "bold" } },
            ["@constant"] = { fg = colors.peach, style = { "bold" } },
          }
        end,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          telescope = {
            enabled = true,
          },
          which_key = true,
          mason = true,
          neotree = true,
          noice = true,
          lsp_trouble = false,
          dashboard = true,
        },
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
