require('nvim-treesitter.configs').setup({
  highlight = { enable = true, additional_vim_regex_highlighting = false},
  -- We must manually specify which parsers to install
  ensure_installed = {
    "bash", "c", "cpp", "json", "lua", "python", "yaml", "elm",
  },
  indent = { enable = true },
})
