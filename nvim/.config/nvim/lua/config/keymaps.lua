vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

--------------------------------------------------
-- Save / Quit
--------------------------------------------------

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>x<CR>", { desc = "Save & Quit" })

--------------------------------------------------
-- Search
--------------------------------------------------

map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

--------------------------------------------------
-- Window Navigation
--------------------------------------------------

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

--------------------------------------------------
-- Window Resize
--------------------------------------------------

map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
