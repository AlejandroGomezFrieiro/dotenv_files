local status, packer = pcall(require, 'packer')

if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    -- Colormap
    use {'catppuccin/nvim', as = 'catpuccin'}
    use 'wbthomason/packer.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- Rust tools
    use 'simrat39/rust-tools.nvim'
    -- Tree settings
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    -- Utils
    use 'folke/which-key.nvim'
    use 'numToStr/Comment.nvim'

    -- Fuzzy Finding
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    use 'voldikss/vim-floaterm'

    use 'rafamadriz/friendly-snippets'
    use 'L3MON4D3/LuaSnip'
    use 'williamboman/nvim-lsp-installer'
    use 'windwp/nvim-autopairs'
    use 'Yggdroot/indentLine'
    use 'glepnir/lspsaga.nvim'
end)
