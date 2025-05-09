return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "gopls",
          "jdtls",
          "clangd",
          "rust_analyzer",
          "bashls",
          "pyright"
        }
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = true, -- Enable inline diagnostic messages
        signs = true,        -- Show signs in the sign column
        underline = true,    -- Underline diagnostics
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
                useLibraryCodeForTypes = true
              }
            }
          }
        }
      }

      for name, config in pairs(servers) do
        lspconfig[name].setup(config)
      end

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Telescope pickers
      map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
      map("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
      map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
      map("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
      map("n", "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)

      -- LSP native functions
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
      map("n", "<leader>df", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, opts)

      -- Added formatting shortcuts
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

      -- Go to next/prev diagnostic
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)

      -- Show diagnostics in a floating window
      map("n", "<leader>e", vim.diagnostic.open_float, opts)

      -- Type definition
      map("n", "<leader>td", vim.lsp.buf.type_definition, opts)
    end
  }
}
