local function macos_theme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle and handle:read("*a") or ""

  if handle then
    handle:close()
  end

  return result:match("Dark") and "catppuccin-frappe" or "catppuccin-latte"
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = macos_theme(),
    },
  },

  {
    "LazyVim/LazyVim",
    init = function()
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          local theme = macos_theme()

          if vim.g.colors_name ~= theme then
            vim.cmd.colorscheme(theme)
          end
        end,
      })
    end,
  },
}
