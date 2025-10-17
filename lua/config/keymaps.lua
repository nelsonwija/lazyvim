-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set({ "i", "v" }, "jk", "<ESC>")
keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>")

-- center
keymap.set({ "n", "v" }, "G", "Gzz")
keymap.set({ "n", "v" }, "gg", "ggzz")
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")

-- select all
