-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

vim.g.ranger_map_keys = 0
map("n", "§", ":wincmd q<CR>")
map("n", "ä", "<C-d>", { remap = true })
map("n", "å", "<C-u>", { remap = true })
map("n", "ö", ":w<CR>")
map("v", "ö", "<ESC>")
map("i", "ö", "<ESC>")
map("n", "<TAB>", ":BufferLineCycleNext<CR>", { desc = "Switch buffers" })
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { desc = "Switch buffers" })
map("n", "<C-s>", ":w<CR>", { desc = "Save with Ctrl + s" })
map("n", "Y", "y$", { desc = "Yank to end of line" })

map("t", "<C-a>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
map("n", "<C-a>", ":ToggleTerm<CR>", { desc = "Exit terminal mode" })

map("n", "F", ":Telescope grep_string", { desc = "FIND" })
vim.api.nvim_set_keymap("v", "<c-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
