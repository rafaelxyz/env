return {
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Hint = " ",
          Error = "|",
          Warn = "!",
          Info = "i",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "|",
            [vim.diagnostic.severity.WARN] = "!",
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = "i",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<S-Down>"] = require("telescope.actions").cycle_history_next,
            ["<S-Up>"] = require("telescope.actions").cycle_history_prev,
          },
        },
      },
    },
  },
}
