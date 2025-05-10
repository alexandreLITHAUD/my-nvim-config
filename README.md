# My Personal Nvim Configuration

> This is the configuration I use for my neovim

## Tools needed

For this conf you will need a couple of tools as well as a nerd Font. I personally Use [**FiraCode Nerd Font (Regular)**](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip).
The tools needed are :

- [neovim](https://github.com/neovim/neovim)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [curl](https://github.com/curl/curl)
- [git](https://github.com/git/git)

## Plugins Installed

Here is the list of the plugins that I use in this configuration :

- [catppuccin](https://github.com/catppuccin/nvim): for clean and goos looking nvim theme
- [comments](https://github.com/numToStr/Comment.nvim): for commenting parts of the code direclty using vim motions
- [telescope](https://github.com/nvim-telescope/telescope.nvim): for easily accessing file and live grep
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim): for accessing the filetree
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): for aparsing asl from different language
- [lualine](https://github.com/nvim-lualine/lualine.nvim): for a cool info line at the bottom
- [none-ls](https://github.com/nvimtools/none-ls.nvim): for ealisy adding formatter and linter to nvim using Mason
- [mason](https://github.com/mason-org/mason.nvim): for installing all th eneeded lsp and tools
- [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim): for linking mason and the LSPs
- [mason-tools-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim): for downloading and checking the mason state
- [nvim-lsp-config](https://github.com/neovim/nvim-lspconfig): for installing LSPs
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): for enableling autocompletion
- [luasnip](https://github.com/L3MON4D3/LuaSnip): for enableling snippets

## LSPs Added

Here is the list of the LSPs that I have installed for the moment (Probably wont be up to date):

- lua_ls: Lua
- gopls: Golang
- jdtls: Java
- clangd: C++
- rust_analyzer: Rust
- bashls: Bash
- pyright: Python

I also have formatters and some linters. You can check them in the none-ls configuration [here](./lua/plugins/none-ls.lua)

## Keymaps

Here is the keymaps that I use:

### Telescope

- \<leader\>a -> find_files
- \<leader>\fg -> live_grep
- \<leader>\dl -> lsp diagnostic
- \<leader>\df -> lsp diagnostic nobuffer
- gd -> lsp definition
- gr -> lsp reference
- gi -> lsp implementation
- gs -> lsp document symbol
- gS -> lsp workspace symbol

### Neo-Tree

- \<leader>\z -> open tree
- v -> split vertical
- s -> split horizontal

### Comments

- \<leader>\\/ -> comment or decomments line or selected lines

### LSPs

- K -> Lsp doc hover
- \<leader>\rn -> lsp rename
- \<leader>\ca -> lsp code action
- \<leader>\f -> lsp formatting
- \<leader>\e -> lsp show diagnostic
- \<leader>\td -> lsp type definition
- [d -> lsp diagnostic prev
- ]d -> lsp diagnostic next

### Autocompletion

- \<C-Space>\ -> call autocomplete
- \<C-e>\ -> abort autocomplete
- \<C-b>\ -> revert doc autocomplete
- \<C-f>\ -> forward doc autocomplete

### Vim Basic Keymaps

The rest of the vim keymaps are in the [vim-keymaps.lua](./lua/vim-keymaps.lua) file.

## Note

Feel free to use, fork or modify this configuration to you will. And I would love to have some advice if you see things that can be improved !
