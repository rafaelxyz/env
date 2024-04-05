return {
  -- { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          -- Error = " ",
          -- Warn  = " ",
          -- Info  = " ",
          Hint  = " ",
          Error = "|",
          Warn  = "!",
          Info  = "i",
        },
      }
    }
  },
}
