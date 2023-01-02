local builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

-- Harpoon
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, {})
vim.keymap.set("n", "<leader>hq", require("harpoon.ui").toggle_quick_menu, {})
vim.keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, {})
vim.keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, {})

-- Netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", {})

-- Paste and keep the item in the default register
vim.keymap.set("x", "<leader>p", "\"_dP")
