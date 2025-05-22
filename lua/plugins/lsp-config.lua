return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"jdtls",
					"clangd",
					"rust_analyzer",
					"bashls",
					"pyright",
					"yamlls",
					"dockerls",
					"terraformls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"black", -- Python formatter
					"stylua", -- Lua formatter
					"prettier", -- JS/TS/Web formatter
					"goimports", -- Go imports formatter
					"shfmt", -- Shell formatter
					"clang-format", -- C/C++ formatter
					"yamlfmt", -- Yaml formatter
					-- Linters
					"golangci-lint", -- Go linter
					"pylint", -- Python linter
					"markdownlint", -- Markdown linter
					"yamllint", -- YAML linter
					"hadolint", -- Dockerfile linter
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Add dependency for cmp-nvim-lsp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = true, -- Enable inline diagnostic messages
				signs = true, -- Show signs in the sign column
				underline = true, -- Underline diagnostics
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Change diagnostic symbols in the sign column
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Get capabilities for autocompletion
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				lua_ls = {},
				gopls = {},
				jdtls = {},
				clangd = {},
				rust_analyzer = {},
				bashls = {},
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemas = {
								["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
								["https://json.schemastore.org/gitlab-ci.json"] = "/*gitlab-ci*.yaml",
								["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json"] = {
									"/*k8s*.yaml",
									"/*k8s*.yml",
									"/*kubernetes*.yaml",
									"/*kubernetes*.yml",
									"/*.k8s.yaml",
									"/*.k8s.yml",
								},
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
									"*docker-compose*.yml",
									"*docker-compose*.yaml",
								},
								["https://json.schemastore.org/helmfile.json"] = "*helmfile*.yaml",
								["https://json.schemastore.org/chart.json"] = "Chart.yaml",
								["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
							},
							validate = true,
							completion = true,
							hover = true,
						},
					},
				},
				dockerls = {},
				terraformls = {},
			}

			for name, config in pairs(servers) do
				-- Add capabilities to each server configuration
				config.capabilities = capabilities
				lspconfig[name].setup(config)
			end
		end,
	},
}
