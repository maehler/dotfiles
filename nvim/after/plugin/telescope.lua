-- telescope setup
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			}
		}
	}
})

-- enable git-worktree telescope extension
require("telescope").load_extension("git_worktree")

-- enable telescipte fzf native
pcall(require("telescope").load_extension, "fzf")

-- telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>gt", require("telescope").extensions.git_worktree.git_worktrees, { desc = "List [G]it work[T]rees" })
vim.keymap.set("n", "<leader>gc", require("telescope").extensions.git_worktree.create_git_worktree, { desc = "[G]it worktree [C]reate" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Search existing [B]uffers" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep [P]roject [S]earch" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>dd", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "[D]ocument [D]diagnostics" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzy find in current buffer" })
