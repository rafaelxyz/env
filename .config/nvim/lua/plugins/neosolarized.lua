return {
  { "overcache/NeoSolarized" },
  { "LazyVim/LazyVim", opts = { colorscheme = "NeoSolarized" } },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   options = { theme = "codedark" },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = { theme = "solarized_light" },
      }
    end,
  },
}
