return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'solarized'
  end,
}
