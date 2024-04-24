return {
  -- { "s1n7ax/nvim-window-picker" },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },   -- Indentation guides
  { "folke/flash.nvim", enabled = false },                      -- Text search with labels
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
  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "maxmx03/solarized.nvim", priority = 1000, lazy = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
