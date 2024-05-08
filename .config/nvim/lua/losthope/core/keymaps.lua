vim.g.mapleader = " "

local keymap = vim.keymap 

-- General Keymaps

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<leader>bn", ":bnext<CR>") -- next buffer
keymap.set("n", "<leader>bp", ":bprevious<CR>") -- previous buffer
keymap.set("n", "<leader>bd", ":bdelete<CR>") -- delete buffer

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- find files 
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>") -- see keybindigs

-- Terminal

keymap.set("n", "<leader>ot", ":ToggleTerm<CR>")
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
