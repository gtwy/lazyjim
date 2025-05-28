return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "bash",
          "html",
          "css",
          "javascript",
          "typescript",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "dockerfile",
          "gitcommit",
          "toml",
          "query",
        },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end,
  },
}
