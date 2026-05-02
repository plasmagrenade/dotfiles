-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- restore original indent behavior
pcall(vim.keymap.del, "x", "<")
pcall(vim.keymap.del, "x", ">")

-- fix Y behavior to behave like D and C
vim.keymap.set("n", "Y", "y$")

-- make search results be centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save all files" })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

-- Toggle line numbers and fold column
vim.keymap.set("n", "<leader>n", function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.foldcolumn = vim.opt.foldcolumn:get() == "0" and "1" or "0"
end, { desc = "Toggle line numbers" })

-- Jump to end of paste/yank
vim.keymap.set({ "v" }, "y", "y`]", { silent = true })
vim.keymap.set({ "n", "v" }, "p", "p`]", { silent = true })

-- Sudo write
vim.keymap.set("c", "w!!", "%!sudo tee > /dev/null %", { desc = "Sudo write" })
