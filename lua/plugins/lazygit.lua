return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Configure LazyGit terminal behavior
		vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
		vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
		vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
		vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

		-- Function to configure LazyGit terminal
		function _G.configure_lazygit_terminal()
			-- Don't map escape in LazyGit terminal - let LazyGit handle it
			vim.keymap.set("t", "<esc>", "<esc>", { buffer = 0, nowait = true })
			-- Only allow Ctrl+\ Ctrl+n to exit terminal mode in LazyGit
			vim.keymap.set("t", "<C-\\><C-n>", "<C-\\><C-n>", { buffer = 0 })
		end

		-- Apply configuration when LazyGit terminal opens
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*lazygit*",
			callback = function()
				configure_lazygit_terminal()
			end,
		})
	end,
}
