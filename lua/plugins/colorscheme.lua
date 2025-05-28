-- luacheck: globals vim
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    -- priority = 1000,
    -- config = function()
    -- 	require("nordic").load()
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        -- background = {
        -- 	dark = "dragon",
        -- 	light = "lotus",
        -- },
      })
      -- vim.cmd("colorscheme kanagawa")
    end,
  },
  -- {
  -- 	"ViViDboarder/wombat.nvim",
  -- 	dependencies = { { "rktjmp/lush.nvim" } },
  -- 	opts = {
  -- 		ansi_colors_name = nil,
  -- 	},
  -- },
  -- {
  -- 	"dasupradyumna/midnight.nvim",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- },
  -- {
  -- 	"blazkowolf/gruber-darker.nvim",
  -- },
  -- {
  -- 	"navarasu/onedark.nvim",
  -- 	priority = 1000,
  -- 	config = function()
  -- 		require("onedark").setup({
  -- 			style = "warm",
  -- 		})
  -- 		require("onedark").load()
  -- 	end,
  -- },
  -- {
  -- 	"xiantang/darcula-dark.nvim",
  -- 	dependencies = {
  -- 		"nvim-treesitter/nvim-treesitter",
  -- 	},
  -- },
}
