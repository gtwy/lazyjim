-- luacheck: globals vim Snacks
return {
  -- Core Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    build = function()
      -- Build FZF native if not already built
      local fzf_build_path = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim/build/libfzf.so"
      if not vim.loop.fs_stat(fzf_build_path) then
        vim.cmd("!cd " .. vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim && make")
      end
    end,
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key", -- keybinding help in insert mode
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            grouped = true,
            hidden = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")

      local fb = telescope.extensions.file_browser.file_browser

      -- Keymaps
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, desc = "" }

      keymap("n", "<leader>ff", function()
        local root = Snacks.git.get_root() or vim.loop.cwd()
        require("telescope.builtin").find_files({ cwd = root })
      end, vim.tbl_extend("force", opts, { desc = "Find files" }))

      -- keymap("n", "<space><space>", function()
      --   local root = Snacks.git.get_root() or vim.loop.cwd()
      --   require("telescope.builtin").find_files({ cwd = root })
      -- end, { noremap = true, silent = true })

      keymap("n", "<leader>fg", function()
        local root = Snacks.git.get_root() or vim.loop.cwd()
        require("telescope.builtin").live_grep({ cwd = root })
      end, vim.tbl_extend("force", opts, { desc = "Grep project" }))
      keymap("n", "<leader>bl", "<cmd>Telescope buffers<CR>", vim.tbl_extend("force", opts, { desc = "List buffers" }))
      keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", vim.tbl_extend("force", opts, { desc = "Recent files" }))
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", vim.tbl_extend("force", opts, { desc = "Search help" }))
      -- keymap(
      -- 	"n",
      -- 	"<leader>jm",
      -- 	"<cmd>Telescope marks<CR>",
      -- 	vim.tbl_extend("force", opts, { desc = "Jump to mark" })
      -- )
      -- keymap(
      -- 	"n",
      -- 	"<leader>fR",
      -- 	"<cmd>Telescope registers<CR>",
      -- 	vim.tbl_extend("force", opts, { desc = "Search registers" })
      -- )
      keymap(
        "n",
        "<leader>lc",
        "<cmd>Telescope commands<CR>",
        vim.tbl_extend("force", opts, { desc = "List commands" })
      )

      -- File Browser (project root or cwd)
      keymap("n", "<leader>E", function()
        local root = Snacks.git.get_root()

        require("telescope").extensions.file_browser.file_browser({
          cwd = root,
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
        })
      end, vim.tbl_extend("force", opts, { desc = "File browser (project root)" }))

      -- File Browser (directory of current file)
      keymap("n", "<leader>e", function()
        fb({
          path = vim.fn.expand("%:p:h"),
          cwd = vim.fn.expand("%:p:h"),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
        })
      end, vim.tbl_extend("force", opts, { desc = "File browser (current dir)" }))
    end,
  },
}
