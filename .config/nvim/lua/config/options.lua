-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


local opt = vim.opt

vim.g.autoformat = false

if os.getenv("WSL_DISTRO_NAME") then
  opt.background = "dark"
else
  opt.background = "light"
end

opt.relativenumber = false
opt.clipboard = "unnamed"

-- For diagnostic popup
opt.updatetime = 250
