-- luacheck: globals vim
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- for file icons
			"moll/vim-bbye", -- optional: for :Bdelete command
		},
		event = "BufWinEnter",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- "tabs" if you want tab-style
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_buffer_close_icons = false,
					show_close_icon = false,
					enforce_regular_tabs = true,
				},
			})

			-- Optional keymaps
			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
			vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete Buffer" })
		end,
	},
}
