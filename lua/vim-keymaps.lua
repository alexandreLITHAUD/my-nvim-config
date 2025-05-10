-- Identation with tab keymap
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })

-- Window navigation with Ctrl + direction
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window navigation with <leader>s + arrow keys
vim.keymap.set("n", "<leader>s<Left>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>s<Down>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>s<Up>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>s<Right>", "<C-w>l", { desc = "Move to right window" })

-- Resize splits with <leader>r + arrow keys
vim.keymap.set("n", "<leader>r<Up>", ":resize +5<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<leader>r<Down>", ":resize -5<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<leader>r<Right>", ":vertical resize +5<CR>", { desc = "Increase width" })
vim.keymap.set("n", "<leader>r<Left>", ":vertical resize -5<CR>", { desc = "Decrease width" })
