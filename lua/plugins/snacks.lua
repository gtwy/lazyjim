return {
  {
    "folke/snacks.nvim",
    opts = {
      modules = {
        -- Core snack modules you want
        scratch = true,
        git = true,

        -- Optional snacks you may enable later
        explorer = false, -- replaced by telescope
        picker = false, -- replaced by telescope
        notify = false,
        notifier = false,
        input = false,
        toggle = false,
        statuscolumn = false,
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
    end,
  },
}
