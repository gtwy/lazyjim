-- luacheck: globals vim Snacks
return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- load early
    config = function()
      require("persistence").setup({
        dir = vim.fn.stdpath("state") .. "/sessions/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore session (dir)",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore session (global)",
      },
    },
  },
}
