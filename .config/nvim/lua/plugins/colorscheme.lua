local function current_theme()
  if vim.fn.has("macunix") ~= 1 then
    return vim.o.background == "dark" and "catppuccin-frappe" or "catppuccin-latte"
  end

  -- `defaults` exits nonzero for Light mode (no AppleInterfaceStyle key).
  local result = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
  return vim.v.shell_error == 0 and result:match("Dark") and "catppuccin-frappe" or "catppuccin-latte"
end

local function refresh_theme()
  if vim.g.vscode then
    return
  end
  local theme = current_theme()
  if vim.g.colors_name ~= theme then
    vim.cmd.colorscheme(theme)
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = current_theme() },
    init = function()
      -- FocusGained alone misses appearance changes while Neovim has focus.
      -- Poll only on macOS, every 10 seconds, and release the timer on exit.
      if vim.fn.has("macunix") == 1 then
        local timer = vim.uv.new_timer()
        if timer then
          timer:start(10000, 10000, vim.schedule_wrap(refresh_theme))
          vim.api.nvim_create_autocmd("VimLeavePre", {
            once = true,
            callback = function()
              timer:stop()
              timer:close()
            end,
          })
        end
      end
      vim.api.nvim_create_autocmd("FocusGained", { callback = refresh_theme })
    end,
  },
}
