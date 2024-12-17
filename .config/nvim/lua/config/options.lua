-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.autoformat = false

if os.getenv("WSL_DISTRO_NAME") then
  -- opt.background = "dark"
  opt.background = "light"
  vim.g.solarized_termtrans = 1
else
  opt.background = "light"
end

opt.relativenumber = false
opt.clipboard = "unnamed"

-- Set to "basedpyright" or "pyright".
-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- vim.g.fzf_history_dir = "~/.local/share/fzf-history/"
