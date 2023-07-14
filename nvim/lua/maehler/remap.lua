-- Netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", {})

-- Paste and keep the item in the default register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Center after going up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "<C-d>", "<C-d>zz");

-- tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
