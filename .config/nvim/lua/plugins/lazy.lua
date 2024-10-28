return {
  -- { "s1n7ax/nvim-window-picker" },
  { "lukas-reineke/indent-blankline.nvim", enabled = false }, -- Indentation guides
  { "folke/flash.nvim", enabled = false }, -- Text search with labels
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        underline = false,
        signs = {
          text = {
            -- [vim.diagnostic.severity.ERROR] = "",
            -- [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.ERROR] = "-",
            [vim.diagnostic.severity.WARN] = "-",
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
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
  { 'ishan9299/nvim-solarized-lua' },
  -- { "maxmx03/solarized.nvim", priority = 1000, lazy = false }, -- opts = { theme = "neo", palette = "selenized"} },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
