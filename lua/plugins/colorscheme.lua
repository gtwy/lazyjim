return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Make sure it loads before others like lualine
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
