-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

    -- Themes
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
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
--            { "nvim-treesitter/nvim-treesitter" },
        },
    }
    use "kyazdani42/nvim-web-devicons"

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
end)

