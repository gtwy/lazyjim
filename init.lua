-- ~/.config/nvim/init.lua

-- Set leader key early
vim.g.mapleader = " "

-- Install Lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load your plugins from lua/plugins/
require("lazy").setup("plugins")

require("config.keymaps")
require("config.settings")
