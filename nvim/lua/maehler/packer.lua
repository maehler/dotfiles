-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"
    use "gruvbox-community/gruvbox"

    use "tpope/vim-surround"

    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-treesitter/nvim-treesitter"

    use "feline-nvim/feline.nvim"
end)

