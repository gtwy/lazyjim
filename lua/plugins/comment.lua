return {
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup({
        -- 👇 Integrate context-aware commenting
        pre_hook = function(ctx)
          local ts_context = require("ts_context_commentstring.integrations.comment_nvim")
          return ts_context.create_pre_hook()(ctx)
        end,
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("ts_context_commentstring").setup({})
    end,
  },
}
