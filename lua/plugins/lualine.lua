return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for icons
    },
    event = "VeryLazy", -- or remove this to load immediately
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- or set to your theme like "rose-pine", "tokyonight", etc.
          icons_enabled = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
      })
    end,
  },
}
