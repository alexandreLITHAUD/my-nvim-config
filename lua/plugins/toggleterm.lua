return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shade_terminals = false,
			float_opts = {
				border = "single",
				winblend = 0,
			},
			-- Allow Ctrl+D and other terminal shortcuts to work
			on_create = function()
				vim.opt_local.foldcolumn = "0"
				vim.opt_local.signcolumn = "no"
			end,
			-- Terminal keymaps
			on_open = function(term)
				-- Allow normal terminal behavior
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-d>", "<C-d>", { noremap = true })
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-c>", "<C-c>", { noremap = true })
			end,
		})

		-- Function to set terminal keymaps
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- Easy escape from terminal mode
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			-- Window navigation from terminal
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- Apply terminal keymaps when entering terminal
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
