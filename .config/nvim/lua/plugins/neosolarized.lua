if os.getenv('WSL_DISTRO_NAME') then
  THEME = "solarized_dark"
else
  THEME = "solarized_light"
end

return {
  { "overcache/NeoSolarized" },
  { "LazyVim/LazyVim",       opts = { colorscheme = "NeoSolarized" } },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = { theme = THEME },
      }
    end,
  },
}
