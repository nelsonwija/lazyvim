-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set({ "i", "v" }, "jk", "<ESC>")
keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>")

-- center
-- keymap.set({ "n", "v" }, "G", "Gzz")
-- keymap.set({ "n", "v" }, "gg", "ggzz")
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
keymap.set({ "n", "v" }, "$", "_")
keymap.set({ "n", "v" }, "_", "$")

-- keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
-- keymap.set("n", "S", "<Plug>(leap-from-window)")

keymap.set({ "n", "x", "o", "v" }, "$", "_")
keymap.set({ "n", "x", "o", "v" }, "_", "$")

-- Copy to system clipboard with <leader>y
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
-- Paste from system clipboard with <leader>p
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true })
