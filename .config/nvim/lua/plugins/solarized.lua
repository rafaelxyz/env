if os.getenv('WSL_DISTRO_NAME') then
  BACKGROUND = "dark"
else
  BACKGROUND = "light"
end

return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = BACKGROUND
    vim.cmd.colorscheme 'solarized'
  end,
}
