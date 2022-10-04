vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.colorcolumn = "80"

vim.opt.wrap = false

vim.opt.modeline = false

vim.g.mapleader = " "

-- Temporary fix for the Snakemake plugin. For some
-- weird reason the filetype is not properly set when
-- files are opened, but they show up fine in Telescope,
-- for example.
vim.cmd [[
au BufNewFile,Bufread Snakefile set filetype=snakemake
au BufNewFile,Bufread *.smk set filetype=snakemake
]]

-- Wrap Markdown files
vim.cmd [[
augroup TextWrap
    autocmd!
    autocmd FileType markdown setlocal wrap
augroup END
]]
