local telescope = require 'telescope'
local keymap = require 'lib.utils'.keymap

telescope.setup {
    defaults = { 
        file_ignore_patterns = {"node_modules"} 
    } 
}

keymap('n', '<leader>ff', ':Telescope find_files<CR>')
