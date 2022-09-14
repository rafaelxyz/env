-- Options

vim.colorscheme = solarized
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.background = 'light'
vim.opt.ignorecase = true -- Use \C for case sensitive search
vim.opt.smartcase = true
vim.opt.scrolloff = 8 -- Prevents scrolling into empty lines
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.showmode = false -- Don't show mode in bottom row
vim.opt.termguicolors = true -- Needed for bufferline colors, messes with horizontal toggleterm
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Ranger
vim.g.rnvimr_enable_ex = true
vim.g.rnvimr_enable_picker = true

-- vim.g.nvim_tree_respect_buf_cwd = true
