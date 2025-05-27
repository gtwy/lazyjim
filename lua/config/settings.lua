-- luacheck: globals vim
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = ""

-- Disable automatic comment continuation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})

-- Fix indents
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Warnings
vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN }, -- or ERROR to silence warnings
		spacing = 2,
		prefix = "●", -- or "", or a space
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})
