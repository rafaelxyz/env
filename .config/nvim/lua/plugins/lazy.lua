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
            [vim.diagnostic.severity.ERROR] = "=",
            [vim.diagnostic.severity.WARN] = "-",
          },
        },
      },
      -- Builtin LSP inlay hints. (shows types in python)
      inlay_hints = {
        enabled = false,
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

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
         diagnostics = false,
      }
    }
  },

  -- Colorschemes
  -- { 'ishan9299/nvim-solarized-lua' },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "solarized",
  --   },
  -- },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        latte = {
          base =   "#fbf6e4",
          mantle = "#f5f0de",
          crust =  "#f5f0de",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

}
