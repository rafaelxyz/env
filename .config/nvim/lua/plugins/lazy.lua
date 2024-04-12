return {
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
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
