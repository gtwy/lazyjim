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
        sql = { "sql-formatter" },
        ["*"] = {},
      },
      formatters = {
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        },
        prettier = {
          prepend_args = {
            "--tab-width",
            "2",
            "--use-tabs",
            "false",
          },
        },
        shfmt = {
          prepend_args = {
            "-i",
            "2",
            "-ci",
          },
        },
        ["php-cs-fixer"] = {
          -- optional: add custom config path if needed
          -- prepend_args = { "--config=some/path" }
        },
        ["sql-formatter"] = {
          prepend_args = {
            "--indent",
            "  ", -- two literal spaces
          },
        },
      },
    })
  end,
}
