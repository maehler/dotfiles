local builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", {})

-- Paste and keep the item in the default register
vim.keymap.set("x", "<leader>p", "\"_dP")
