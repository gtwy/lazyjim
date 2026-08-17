return {
  "williamboman/mason.nvim",
  lazy = false,
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

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
      "shellcheck",
    }

    local function install_missing()
      for _, tool in ipairs(ensure_installed) do
        local ok, pkg = pcall(registry.get_package, tool)
        if ok and pkg and not pkg:is_installed() and not pkg:is_installing() then
          pkg:install()
        end
      end
    end

    -- Registry is not shipped in-plugin. Refresh first or get_package no-ops on a clean install.
    registry.refresh(function(success)
      if success then
        install_missing()
      end
    end)
  end,
}
