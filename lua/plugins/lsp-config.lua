-- Detect if running on NixOS
local function is_nixos()
	-- Fallback: check /etc/os-release
	local f = io.open("/etc/os-release", "r")
	if f then
		local content = f:read("*all")
		f:close()
		if content:match("ID=nixos") or content:match('ID="nixos"') then
			return true
		end
	end
	return false
end

local on_nixos = is_nixos()

-- Debug: print the detection result
print("NixOS detected: " .. tostring(on_nixos))

return {
	{
		"williamboman/mason.nvim",
		enabled = not on_nixos, -- Disable Mason on NixOS
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = not on_nixos, -- Disable on NixOS
		dependencies = on_nixos and {} or {
			"williamboman/mason.nvim",
		},
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
					"nil_ls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = not on_nixos, -- Disable on NixOS
		dependencies = on_nixos and {} or {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"black",
					"stylua",
					"prettier",
					"goimports",
					"shfmt",
					"clang-format",
					"yamlfmt",
					"nixfmt",
					"nixpkgs-fmt",
					-- Linters
					"golangci-lint",
					"pylint",
					"markdownlint",
					"yamllint",
					"hadolint",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			
			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
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
				nil_ls = {},
			}
			
			for name, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[name].setup(config)
			end
		end,
	},
}
