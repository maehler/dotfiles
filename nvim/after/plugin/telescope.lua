require("plenary.filetype").add_file("snakemake")
local telescope = require("telescope")

telescope.setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
        }
    }
}

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)

telescope.load_extension "file_browser"
