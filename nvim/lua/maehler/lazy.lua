-- install lazy.nvim if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- git
	"tpope/vim-rhubarb",
	"tpope/vim-fugitive",
	"ThePrimeagen/git-worktree.nvim",

	-- vim-surround, couldn't live without it
	"tpope/vim-surround",

	-- detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- show possible keybindings when starting to type something
	-- note: passing `opts = {}` is the same as calling `require("which-key").setup()`
	{ "folke/which-key.nvim",  opts = {} },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opts = true },
	},

	-- LSP stuff
	{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	-- indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- comment block selection with `gc`
	{ "numToStr/Comment.nvim", opts = {} },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	-- harpoon
	"theprimeagen/harpoon",

	-- nextflow
	"raivivek/nextflow-vim",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- -- codeium
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function ()
	-- 		require("codeium").setup({
	-- 			enable_chat = false,
	-- 		})
	-- 	end
	-- },

	-- delimited files
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
		cmd = {
			"RainbowDelim",
			"RainbowDelimSimple",
			"RainbowDelimQuoted",
			"RainbowMultiDelim",
		}
	},
}, {})
