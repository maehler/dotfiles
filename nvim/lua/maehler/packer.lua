-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

    -- Themes
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "marko-cerovac/material.nvim"
    use "feline-nvim/feline.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- tpope
    use "tpope/vim-surround"

    -- Navigation
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim"
    }
    use "kyazdani42/nvim-web-devicons"
    use "ThePrimeagen/harpoon"

    -- Languages
    use {
        "snakemake/snakemake",
        rtp = "misc/vim",
    }
    use {
        "yuezk/vim-js",
    }
    use {
        "Mxrcon/nextflow-vim",
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
end)

