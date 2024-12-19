return {

  { "lukas-reineke/indent-blankline.nvim", enabled = false }, -- Indentation guides
  { "folke/flash.nvim", enabled = false }, -- Text search with labels
  { "junegunn/fzf", build = "./install --bin" },

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
    "akinsho/bufferline.nvim",
    opts = {
      options = {
         diagnostics = false,
      }
    }
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        latte = {
          base = "#fdf6e3",
          mantle = "#f7f1dc",
          crust = "#f5ecd7",
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

  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = function(_, opts)
    return {
      "default-title",
      ui_select = function(fzf_opts, items)
        return vim.tbl_deep_extend("force", fzf_opts, {
          winopts = {
            preview = {
              scrollbar = false,
            },
          },
        }, fzf_opts.kind == "codeaction" and { winopts = { }, } or { winopts = { },
        })
      end,
      }
    end,
  },
}
