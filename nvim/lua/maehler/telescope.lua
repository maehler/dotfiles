require("plenary.filetype").add_file("snakemake")
telescope = require("telescope")

telescope.setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
        }
    }
}

telescope.load_extension "file_browser"
