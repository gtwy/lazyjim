return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ts = require("nvim-treesitter")
      local ensure = {
        "lua",
        "python",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "gitcommit",
        "toml",
        "query",
      }

      local have = {}
      local ok, installed = pcall(ts.get_installed)
      if ok and type(installed) == "table" then
        for _, name in ipairs(installed) do
          have[name] = true
        end
      end

      local missing = {}
      for _, name in ipairs(ensure) do
        if not have[name] then
          table.insert(missing, name)
        end
      end
      if #missing > 0 and type(ts.install) == "function" then
        ts.install(missing)
      end

      -- indent stays off (no indentexpr)
      -- html: treesitter highlight on an unclosed quote corrupts the display
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          if ft == "html" then
            pcall(vim.treesitter.stop, args.buf)
            return
          end
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
