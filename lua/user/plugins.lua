-- plugins.lua

local packer = require 'lib.packer-init'

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        'dracula/vim',
        as = 'dracula',
        --'rmehri01/onenord.nvim',
        --branch = 'main',
        config = function()
            require('user.plugins.theme')
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.lualine')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            require('user.plugins.telescope')
        end
    }

end)
