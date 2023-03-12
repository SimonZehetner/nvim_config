local opts = {  noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Leader
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode
-- Split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with Arrow Keys
map("n", "<C-Up>",    ":resize +2<CR>", opts)
map("n", "<C-Down>",  ":resize -2<CR>", opts)
map("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

map("n", "0", "^", opts)
map("n", "^", "0", opts)

-- Insert
map("i", "jj", "<Esc>", opts)


-- Visual
-- Stay in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "J", ":m .+1<CR>==", opts)
map("v", "K", ":m .-2<CR>==", opts)

map("v", "p", '"_dp', opts)


-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

