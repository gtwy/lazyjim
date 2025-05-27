return {
	{
		"folke/snacks.nvim",
		opts = {
			modules = {
				-- Core snack modules you want
				explorer = true,
				picker = true,
				scratch = true,
				git = true,

				-- Optional snacks you may enable later
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
