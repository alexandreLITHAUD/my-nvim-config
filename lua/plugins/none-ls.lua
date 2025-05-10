return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		-- Setup all sources (formatters AND linters)
		null_ls.setup({
			sources = {
				-- Python
				null_ls.builtins.formatting.black, -- Formatter
				null_ls.builtins.diagnostics.pylint, -- Linter

				-- Lua
				null_ls.builtins.formatting.stylua, -- Formatter

				-- JavaScript/TypeScript
				null_ls.builtins.formatting.prettier, -- Formatter

				-- Go
				null_ls.builtins.formatting.gofmt, -- Formatter
				null_ls.builtins.formatting.goimports, -- Formatter
				null_ls.builtins.diagnostics.golangci_lint, -- Linter

				-- Bash/Shell
				null_ls.builtins.formatting.shfmt, -- Formatter

				-- C/C++
				null_ls.builtins.formatting.clang_format, -- Formatter

				-- Markdown
				null_ls.builtins.formatting.mdformat, -- Formatter
			},
			-- Setup keybindings for formatting
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					-- Format with <leader>f
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({
							async = true,
							bufnr = bufnr,
							filter = function(filter_client)
								-- Prefer none-ls for formatting if available
								return filter_client.name == "null-ls"
							end,
						})
					end, { buffer = bufnr, desc = "Format document" })

					-- Optional: Format on save
					-- Uncomment this if you want format-on-save
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								bufnr = bufnr,
								filter = function(filter_client)
									return filter_client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
