-- plugins.lua

local packer = require 'lib.packer-init'

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        -- 'morhetz/gruvbox', as = 'gruvbox',
        -- 'dracula/vim', as = 'dracula',
        -- 'rmehri01/onenord.nvim', branch = 'main',
        'EdenEast/nightfox.nvim', as = 'nightfox',
        config = function()
            vim.cmd([[ colorscheme nightfox ]])
        end
    }

    -- use {
    --     'glepnir/dashboard-nvim',
    --     config = function()
    --         require('user.plugins.dashboard')
    --     end
    -- }

    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.bufferline')
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
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.nvim-tree')
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

    use { 
        'ahmedkhalf/project.nvim',
        config = function()
            require('user.plugins.project')
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        },
        config = function()
            require('user.plugins.cmp')
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        requires = 'saadparwaiz1/cmp_luasnip',
        config = function()
            require('user.plugins.luasnip')
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('user.plugins.comment')
        end
    }

    use {
        'folke/which-key.nvim',
        config = function()
            require('user.plugins.whichkey')
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('user.plugins.neogit')
        end
    }

    use {
        'preservim/vim-markdown',
        config = function()
            require('user.plugins.vim-markdown')
        end
    }

    use {
        'nvim-orgmode/orgmode',
        requires = {
            { 'nvim-treesitter/nvim-treesitter' },
            { 'hrsh7th/nvim-cmp' },
        },
        config = function()
            require('user.plugins.orgmode')
        end
    }

    -- use {
    --     'akinsho/org-bullets.nvim',
    --     config = function()
    --         require('user.plugins.org-bullets')
    --     end
    -- }

    use {
        'ishchow/nvim-deardiary',
        config = function()
            require('user.plugins.deardiary')
        end
    }

end)
