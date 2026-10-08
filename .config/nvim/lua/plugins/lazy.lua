return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        buffer_close_icon = 'x',
        diagnostics = false,
        indicator = {
            style = 'underline',
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- virtual_text = false,
        -- underline = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "!",
            [vim.diagnostic.severity.WARN] = "-",
          },
        },
      },
      -- Builtin LSP inlay hints. (shows types in python)
      inlay_hints = {
        enabled = true,
      },
    },
  },

  { -- autocomplete with Tab
    {
      "saghen/blink.cmp",
      opts = {
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_and_accept", "fallback" },
          ["<CR>"] = { "fallback" },
        },
      },
    },
  },

  {
    "folke/snacks.nvim",
  },

}
