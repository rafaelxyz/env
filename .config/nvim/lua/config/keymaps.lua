-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

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
vim.api.nvim_set_keymap("v", "<c-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
-- Move selected lines with shift+j or shift+k
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-c>", "ciw")
map("n", "<C-q>", ":w|!python %")


-- Copy current file's absolute path
map("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  vim.notify("File path copied")
end, { desc = "Copy file path" })

-- Terminal in current file's directory
map("n", "<leader>fT", function()
  Snacks.terminal(nil, {
    cwd = vim.fn.expand("%:p:h"),
  })
end, { desc = "Terminal (Current File Dir)" })

map("n", "<leader>ld", function()
  Snacks.dashboard()
end, { desc = "Open Dashboard" })

map("n", "<leader>lo", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })
