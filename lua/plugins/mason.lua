return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

    -- Auto-install specific tools
    local registry = require("mason-registry")

    local ensure_installed = {
      "ruff",
      "black",
      "prettier",
      "eslint_d",
      "stylua",
      "shfmt",
      "php-cs-fixer",
      "sql-formatter",
      "markdownlint",
      "jsonlint",
      "luacheck",
    }

    for _, tool in ipairs(ensure_installed) do
      local ok, pkg = pcall(registry.get_package, tool)
      if ok and not pkg:is_installed() then
        pkg:install()
      end
    end
  end,
}
