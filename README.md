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

All the plugins I use are managed with [**lazy.nvim**](https://github.com/folke/lazy.nvim)

Here’s the list of plugins included in this setup:

| Plugin                                                                                   | Purpose                                                               |
| ---------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| [**catppuccin**](https://github.com/catppuccin/nvim)                                     | Aesthetic and clean color scheme                                      |
| [**Comment.nvim**](https://github.com/numToStr/Comment.nvim)                             | Easy code commenting with motions                                     |
| [**Telescope**](https://github.com/nvim-telescope/telescope.nvim)                        | File finder, live grep, and more                                      |
| [**Neo-tree**](https://github.com/nvim-neo-tree/neo-tree.nvim)                           | A modern file explorer                                                |
| [**Treesitter**](https://github.com/nvim-treesitter/nvim-treesitter)                     | Syntax highlighting and code parsing                                  |
| [**Lualine**](https://github.com/nvim-lualine/lualine.nvim)                              | Status line with useful info                                          |
| [**None-LS**](https://github.com/nvimtools/none-ls.nvim)                                 | Integrate linters/formatters with ease                                |
| [**Mason**](https://github.com/mason-org/mason.nvim)                                     | Install/manage LSPs, DAPs, and tools                                  |
| [**mason-lspconfig**](https://github.com/mason-org/mason-lspconfig.nvim)                 | Bridge between Mason and LSP                                          |
| [**mason-tool-installer**](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install language tools                                           |
| [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig)                           | Configure built-in LSP support                                        |
| [**nvim-cmp**](https://github.com/hrsh7th/nvim-cmp)                                      | Autocompletion engine                                                 |
| [**LuaSnip**](https://github.com/L3MON4D3/LuaSnip)                                       | Snippet engine                                                        |
| [**todo-comments**](https://github.com/folke/todo-comments.nvim)                         | Highlight and search TODO/FIXME/etc                                   |
| [**dashboard-nvim**](https://github.com/nvimdev/dashboard-nvim)                          | Customizable start screen                                             |
| [**noice**](https://github.com/folke/noice.nvim)                                         | Better notifications                                                  |
| [**which-key**](https://github.com/folke/which-key.nvim)                                 | Show key mappings                                                     |
| [**toggleterm**](https://github.com/folke/which-key.nvim)                                | Terminal integration                                                  |
| [**autopairs**](https://github.com/windwp/nvim-autopairs)                                | Auto-close quotes, brackets, etc.                                     |
| [**toggleterm**](https://github.com/akinsho/toggleterm.nvim)                             | Enable to create terminal inside nvim                                 |
| [**sops**](https://github.com/lucidph3nx/nvim-sops)                                      | Encrypt and decrypt sops files                                        |
| [**lazygit**](https://github.com/kdheepak/lazygit.nvim)                                  | Enable to launch lazygit windows inside nvim                          |
| [**harpoon**](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)                     | Create hooks for files and shortcuts                                  |
| [**gitsigns**](https://github.com/lewis6991/gitsigns.nvim)                               | Add git annotations when file changes and non commited                |
| [**dashboard**](https://github.com/nvimdev/dashboard-nvim)                               | Add a main windows dashboard when launching nvim                      |
| [**copilot**](https://github.com/zbirenbaum/copilot.lua)                                 | Add copilot to nvim                                                   |
| [**neoscroll**](https://github.com/karb94/neoscroll.nvim)                                | Add a smooth scroll to neovim                                         |
| [**ident-blockline**](https://github.com/lukas-reineke/indent-blankline.nvim)            | Add blank line indent indicator                                       |
| [**windows**](https://github.com/anuvyklack/windows.nvim)                                | Automatically resize windows with nice animation                      |
| [**Smooth Cursor**](https://github.com/gen740/SmoothCursor.nvim)                         | Add nice cursor movement and animation                                |
| [**dressing**](https://github.com/stevearc/dressing.nvim)                                | Add nice windows looks (should be replace sometimes with snacks.nvim) |

---

## 🧠 LSPs and Tools

All the lsps, formatters and linters are managed with [**mason.nvim**](https://github.com/mason-org/mason.nvim) and will install them automatically at startup if they are not already installed. For NixOS machine, Mason is disabled. See the NixOS section for more details.

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
- **nil_ls** → Nix

I also use formatters and linters via `none-ls`. You can find the full list in [`lua/plugins/none-ls.lua`](./lua/plugins/none-ls.lua).

When you want to add a new LSP, formatter or linter, you should add it to the none-ls configuration so it can be used in the best condition whether you install it with Mason or not.

---

## 🎹 Keymaps

The configuration of the keymaps are dealt with which-key.nvim and are defined in [`lua/keymaps/`](./lua/keymaps/).

Here are the custom key mappings I use in this config:

### 🔭 Telescope

- `<leader>a` → Find files
- `<leader>f` → Live grep
- `gd` → Go to definition
- `gr` → Go to references
- `gi` → Go to implementation
- `gs` → Document symbols
- `gS` → Workspace symbols

### 🌳 Neo-tree

- `<leader>z` → Toggle file tree on or off
- `v` → Vertical split
- `s` → Horizontal split

### 💬 Comments

- `<leader>/` → Toggle comment on line or selection

### 🧠 LSP

- `<leader>cd` → Go to definition
- `<leader>cD` → Go to declaration
- `<leader>cr` → Go to references
- `<leader>ci` → Go to implementation
- `<leader>ct` → Go to type definition
- `<leader>cs` → Document symbols
- `<leader>cS` → Workspace symbols
- `<leader>ce` → Show line diagnostics
- `<leader>cw` → All diagnostics
- `<leader>ca` → Code action
- `<leader>cn` → Rename symbol
- `<leader>cf` → Format document
- `<leader>ck` → Hover documentation
- `<leader>cg` → Signature help

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

### 🪄 Harpoon2

- `<C-e>` → Add file to harpoon2
- `<C-d>` → Remove current file from harpoon2
- `<leader>e` → Open harpoon2 quick menu

### 🔒 Sops

- `<leader>dd` Decrypt current file with sops
- `<leader>de` Encrypt current file with sops

### 🔧 LazyGit

- `<leader>g` → Open LazyGit in a terminal window

### 🔍 Navigation

- `<leader>h` → Move to left window
- `<leader>j` → Move to bottom window
- `<leader>k` → Move to top window
- `<leader>l` → Move to right window
- `<leader>r<up>` → Resize window up
- `<leader>r<right>` → Resize window right
- `<leader>r<left>` → Resize window left
- `<leader>r<down>` → Resize window down

### 🔄 Buffer Management

- `<leader><leader>` → Switch to last used Buffer
- `<leader>bb` → List all open Buffers
- `<leader>bd` → Close current Buffer
- `<leader>bD` → Close all Buffers except current
- `<leader>bx` → Close all Buffers but keep window

---

## ❄️ NixOS Specifics

I mainly use NixOS as my operating system. Therefore, if you're using NixOS, you might want to disable Mason's automatic installation of LSPs, formatters, and linters since I manage these tools through Nix packages.

NixOS does not work well with Mason's automatic installation because the tools installed by Mason are not recognized by the Nix package manager. To accommodate this, I've included a condition in the Mason setup that checks if the system is NixOS and disables automatic installation accordingly.

So if you're on NixOS, Mason will not be installed and thus no LSP, formatters or linters will be installed. But all the tools will still be used by none-ls then you will need to install them manually via Nix packages.

Here is the all the tools Mason would install that you need to install via Nix if you are on NixOS (in NixOS 25.05):

```nix
{ pkgs, ... }: {
  home.packages = with pkgs; [

    # LSP servers
    lua-language-server # lua_ls
    gopls # Go
    jdt-language-server # Java
    clang-tools # clangd for C/C++
    rust-analyzer # Rust
    nodePackages.bash-language-server # bashls
    pyright # Python
    yaml-language-server # yamlls
    dockerfile-language-server-nodejs # dockerls
    terraform-ls # terraformls
    nil # nil_ls for Nix

    # Formatters
    black # Python
    stylua # Lua
    nodePackages.prettier # JS/TS/Web
    gotools # gofumpt, goimports for Go
    shfmt # Shell
    clang-tools # clang-format
    yamlfmt # YAML
    nixfmt-classic # Nix (or nixfmt-rfc-style)
    nixpkgs-fmt # Alternative Nix formatter
    mdformat # Markdown

    # Linters
    golangci-lint # Go
    pylint # Python
    nodePackages.markdownlint-cli # Markdown
    yamllint # YAML
    hadolint # Dockerfile

  ];
}
```

---

### ⚙️ Vim Basics

Default Vim keymaps and other core bindings are defined in [`lua/vim-keymaps.lua`](./lua/vim-keymaps.lua).

---

## 💡 Final Note

Feel free to **use**, **fork**, or **customize** this configuration to suit your needs.\
If you have suggestions, improvements, or cool plugin ideas, I’d love to hear them!
