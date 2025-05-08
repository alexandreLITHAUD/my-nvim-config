return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"c", "cpp", "lua", "ruby", "java", "go", "rust", "dockerfile", "javascript", "json", "yaml", "toml", "vim", "zig", "html", "cmake"},
      highlight = { enable = true },
      indent = { enable = true },
    })
    vim.keymap.set("n", "<leader>i", "gg=G``", { noremap = true, silent = true })
  end
}
