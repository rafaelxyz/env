return {
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
}
