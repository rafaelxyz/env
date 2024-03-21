-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if os.getenv("WSL_DISTRO_NAME") then
  vim.o.background = "dark"
else
  vim.opt.background = "light"
end

vim.opt.relativenumber = false
vim.g.autoformat = false
