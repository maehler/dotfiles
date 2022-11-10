require("tokyonight").setup({
    transparent = true,
    style = "storm",
    styles = {
        comments = { italic = true },
    },
})

require("material").setup({
    styles = {
        comments = { italic = true },
    },
    disable = {
        background = true,
    },
})

vim.opt.background = "dark"

vim.cmd("colorscheme tokyonight")
