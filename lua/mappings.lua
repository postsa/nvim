require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "U", ":red<CR>")

vim.keymap.del("n", "<C-n>")
vim.keymap.del("n", "<leader>e")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
