-- disable space in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- center when moving half screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- don't clear buffer when pasting over something
vim.keymap.set("x", "<leader>p", [["_dP]])

-- git bindings
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew in netrw" })

-- Tab is doing funky stuff, make it stop...
vim.keymap.set("n", "<TAB>", "<Nop>")

-- diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
