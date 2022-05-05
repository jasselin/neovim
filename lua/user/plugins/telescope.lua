local telescope = require 'telescope'
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

keymap('n', '<leader>ff', ':Telescope find_files<CR>')
keymap('n', '<leader>fg', ':Telescope live_grep<CR>')
keymap('n', '<leader>fb', ':Telescope buffers<CR>')
keymap('n', '<leader>fh', ':Telescope help_tags<CR>')
