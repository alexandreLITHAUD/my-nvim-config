return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
    vim.keymap.set("n", "<leader>i", "gg=G``", { noremap = true, silent = true })
  end
}
