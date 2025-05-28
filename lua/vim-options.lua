vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers (useful for jumps)
vim.opt.numberwidth = 4 -- Minimal number of columns for line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.cursorline = true -- Highlight the line where the cursor is

vim.opt.timeoutlen = 1000
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
