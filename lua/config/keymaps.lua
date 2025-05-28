-- luacheck: globals vim
-- local snacks = require("snacks")

-- get root dir
-- local function get_root()
-- 	local cwd = vim.fn.getcwd()
-- 	local root = vim.fs.find({ ".git" }, { upward = true, type = "directory", path = cwd })[1]
-- 	return root and vim.fs.dirname(root) or cwd
-- end

-- turn mouse on and off
vim.keymap.set("n", "<leader>a", function()
	local mouse_setting = vim.o.mouse
	if mouse_setting == "" then
		vim.opt.mouse = "a"
		vim.notify("Mouse: ON")
	else
		vim.opt.mouse = ""
		vim.notify("Mouse: OFF")
	end
end, { desc = "Toggle mouse mode" })

-- indent without reselect
vim.keymap.set("x", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("x", ">", ">gv", { noremap = true, silent = true })

-- lint on key press
vim.keymap.set("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Lint current file" })

-- Replaced by telescope
-- -- Explorer toggle
-- vim.keymap.set("n", "<leader>e", function()
-- 	require("snacks.explorer").open()
-- end, { desc = "Toggle Explorer" })
--
-- -- File picker
-- vim.keymap.set("n", "<leader>ff", function()
-- 	snacks.picker.files({ cwd = get_root() })
-- end, { desc = "Find File" })
-- vim.keymap.set("n", "<leader>fg", function()
-- 	snacks.picker.grep({ cwd = get_root() })
-- end, { desc = "Grep in Files" })

-- Scratchpad
vim.keymap.set("n", "<leader>ss", function()
	require("snacks.scratch").open()
end, { desc = "Open Scratchpad" })

-- Git signs toggle (statuscolumn handles display)
vim.keymap.set("n", "<leader>gb", function()
	require("snacks.git").blame_line()
end, { desc = "Git for Current Line" })

-- Numberlines toggle
vim.keymap.set("n", "<leader>ln", function()
	if vim.wo.number then
		vim.wo.number = false
		vim.wo.relativenumber = false
	else
		vim.wo.number = true
		vim.wo.relativenumber = false
	end
end, { desc = "Toggle absolute lines" })
vim.keymap.set("n", "<leader>lr", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = false
	else
		vim.wo.relativenumber = true
		vim.wo.number = false
	end
end, { desc = "Toggle relative lines" })
