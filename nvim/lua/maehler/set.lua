-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Basic settings ]]
--
-- disable highlight on search
vim.o.hlsearch = false

-- use 4 space indenting by default
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- cursor margin to the end of the view
vim.o.scrolloff = 8

-- use sign column by default
vim.wo.signcolumn = "yes"

-- decrease the updatetime
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- use terminal colors
vim.o.termguicolors = true
