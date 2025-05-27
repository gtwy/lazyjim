return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false,
      },
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        php = { "php-cs-fixer" },
        lua = { "stylua" },
        sql = { "sql-formatter" }, -- or "pg_format" if you prefer
        ["*"] = {},
      },
    })
  end,
}

