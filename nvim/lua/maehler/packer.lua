-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

    -- Themes
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "marko-cerovac/material.nvim"
    use "feline-nvim/feline.nvim"

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
    use "neovim/nvim-lspconfig"
end)

