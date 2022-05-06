local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local keymap = require 'lib.utils'.keymap

telescope.setup {
    defaults = { 
        file_ignore_patterns = {"node_modules", ".git/"},
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        }
    } 
}

vim.api.nvim_create_user_command(
    'NoteFindFile', 
    function() 
        builtin.find_files { 
            cwd = "~/Dropbox/org" 
        }
    end,
    {}
)

vim.api.nvim_create_user_command(
    'NoteSearch', 
    function() 
        builtin.live_grep { 
            cwd = "~/Dropbox/org" 
        }
    end,
    {}
)
