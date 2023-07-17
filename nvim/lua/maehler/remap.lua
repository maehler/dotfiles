-- Netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", {})

-- Paste and keep the item in the default register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Center after going up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "<C-d>", "<C-d>zz");

-- Delete surrounding function
vim.keymap.set("n", "dsf", "ds(db")
vim.keymap.set("n", "csf", "dsfi")
