# 🧠 My Personal Neovim Configuration

> A fast, clean, and modern Neovim setup tailored to my development workflow.

## 🧰 Requirements

To run this configuration properly, you’ll need a few tools and a Nerd Font. I personally use [**FiraCode Nerd Font (Regular)**](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip).

### Required Tools:

- [Neovim](https://github.com/neovim/neovim) (v0.9+ recommended)
- [ripgrep](https://github.com/BurntSushi/ripgrep) – for Telescope search
- [curl](https://github.com/curl/curl) – for plugin installation and updates
- [git](https://github.com/git/git) – for pulling plugins
- [unzip](https://github.com/LuaDist/unzip) - for certain plugins
- [nodejs](https://github.com/nodejs/node) - for certain plugins
- [python3](https://www.python.org/downloads/) - for pythonbased plugins
- [go](https://github.com/golang/go) - for gobased plugins

Everything can be automatically installed using the nix flake in the repo and do the `nix develop <path to folder> --impure`

---

## 🔌 Plugins

Here’s the list of plugins included in this setup:

| Plugin                                                                                   | Purpose                                |
| ---------------------------------------------------------------------------------------- | -------------------------------------- |
| [**catppuccin**](https://github.com/catppuccin/nvim)                                     | Aesthetic and clean color scheme       |
| [**Comment.nvim**](https://github.com/numToStr/Comment.nvim)                             | Easy code commenting with motions      |
| [**Telescope**](https://github.com/nvim-telescope/telescope.nvim)                        | File finder, live grep, and more       |
| [**Neo-tree**](https://github.com/nvim-neo-tree/neo-tree.nvim)                           | A modern file explorer                 |
| [**Treesitter**](https://github.com/nvim-treesitter/nvim-treesitter)                     | Syntax highlighting and code parsing   |
| [**Lualine**](https://github.com/nvim-lualine/lualine.nvim)                              | Status line with useful info           |
| [**None-LS**](https://github.com/nvimtools/none-ls.nvim)                                 | Integrate linters/formatters with ease |
| [**Mason**](https://github.com/mason-org/mason.nvim)                                     | Install/manage LSPs, DAPs, and tools   |
| [**mason-lspconfig**](https://github.com/mason-org/mason-lspconfig.nvim)                 | Bridge between Mason and LSP           |
| [**mason-tool-installer**](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install language tools            |
| [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig)                           | Configure built-in LSP support         |
| [**nvim-cmp**](https://github.com/hrsh7th/nvim-cmp)                                      | Autocompletion engine                  |
| [**LuaSnip**](https://github.com/L3MON4D3/LuaSnip)                                       | Snippet engine                         |
| [**todo-comments**](https://github.com/folke/todo-comments.nvim)                         | Highlight and search TODO/FIXME/etc    |
| [**dashboard-nvim**](https://github.com/nvimdev/dashboard-nvim)                          | Customizable start screen              |
| [**windsurf**](https://github.com/Exafunction/windsurf.nvim)                             | Ai integration for Nvim                |
| [**noice**](https://github.com/folke/noice.nvim)                                         | Better notifications                   |
| [**which-key**](https://github.com/folke/which-key.nvim)                                 | Show key mappings                      |
| [**toggleterm**](https://github.com/folke/which-key.nvim)                                | Terminal integration                   |
| [**autopairs**](https://github.com/windwp/nvim-autopairs)                                | Auto-close quotes, brackets, etc.      |

---

## 🧠 LSPs and Tools

Here's a snapshot of the language servers I currently use (subject to change):

- **lua_ls** → Lua
- **gopls** → Go
- **jdtls** → Java
- **clangd** → C++
- **rust_analyzer** → Rust
- **bashls** → Bash
- **pyright** → Python
- **yamlls** → YAML
- **dockerls** → Docker
- **terraformls** → Terraform

I also use formatters and linters via `none-ls`. You can find the full list in [`lua/plugins/none-ls.lua`](./lua/plugins/none-ls.lua).

---

## 🎹 Keymaps

Here are the custom key mappings I use in this config:

### 🔭 Telescope

- `<leader>fa` → Find files
- `<leader>fg` → Live grep
- `<leader>gl` → Show LSP diagnostics (buffer)
- `<leader>fd` → Show LSP diagnostics (global)
- `gd` → Go to definition
- `gr` → Go to references
- `gi` → Go to implementation
- `gs` → Document symbols
- `gS` → Workspace symbols

### 🌳 Neo-tree

- `<leader>z` → Toggle file tree
- `v` → Vertical split
- `s` → Horizontal split

### 💬 Comments

- `<leader>/` → Toggle comment on line or selection

### 🧠 LSP

- `<leader>ck` → Show hover documentation
- `<leader>cr` → Rename symbol
- `<leader>ca` → Code actions
- `<leader>cf` → Format buffer
- `<leader>ce` → Show diagnostics
- `<leader>ct` → Go to type definition

### 🤖 Autocompletion

- `<C-Space>` → Trigger autocomplete
- `<C-e>` → Abort autocomplete
- `<C-b>` → Scroll docs up
- `<C-f>` → Scroll docs down

### 📝 TODO Comments

- `<leader>ts` → Telescope search for TODOs

### 🔥 Noice

- `<leader>nn` → Toggle Noice UI
- `<leader>nl` → Show last message
- `<leader>nh` → Show message history
- `<leader>nd` → Dismiss all messages
- `<leader>ne` → Show error messages
- `<leader>nt` → Show messages in Telescope

### 🎯 Toggleterm

- `<leader>tt` → Toggle terminal

---

### ⚙️ Vim Basics

Default Vim keymaps and other core bindings are defined in [`lua/vim-keymaps.lua`](./lua/vim-keymaps.lua).

---

## 💡 Final Note

Feel free to **use**, **fork**, or **customize** this configuration to suit your needs.  
If you have suggestions, improvements, or cool plugin ideas, I’d love to hear them!
