-- luacheck: globals vim
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern", -- Keep modern preset for styling
			triggers = { "<leader>" }, -- Trigger on <leader>
			win = {
				no_overlap = true, -- Prevent overlap with cursor
				border = "single", -- Clean border, similar to LazyVim
				padding = { 1, 2 }, -- [top/bottom, right/left] - matches LazyVim's compact style
				title = true, -- Show title
				title_pos = "center", -- Center the title
				zindex = 1000, -- Ensure popup is on top
				col = vim.o.columns - 40 - 10, -- Right edge: window width - popup width - 10-char offset
				row = vim.o.lines - 10 - 10, -- Bottom edge: window height - estimated popup height - 10-line offset
				width = 40, -- Fixed/max width for narrow, vertical layout
				height = { min = 4, max = 50 }, -- Allow vertical growth
				wo = {
					winblend = 20, -- Opaque popup
				},
				bo = {}, -- No additional buffer options
			},
			layout = {
				width = { min = 20, max = 40 }, -- Constrain column width for vertical look
				spacing = 3, -- Space between columns (if multiple)
				align = "left", -- Left-align content for readability
			},
			expand = 5,
		},
	},
}
