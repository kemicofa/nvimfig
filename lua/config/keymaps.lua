local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centred while scrolling/searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without overwriting register
map("x", "<leader>p", '"_dP')

-- Copy to system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')

-- Delete to void register
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- Format
map("n", "<leader>f", function()
  require("conform").format({ async = true })
end)
