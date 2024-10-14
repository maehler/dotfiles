-- harpoon setup
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "[H]arpoon [A]dd file" })
vim.keymap.set("n", "<leader>hq", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon menu" })
-- Quick navigation for the three first files (good for colemak)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-i>", function() require("harpoon.ui").nav_file(4) end)
