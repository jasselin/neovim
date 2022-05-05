local neogit = require('neogit')
local keymap = require 'lib.utils'.keymap

neogit.setup {}

keymap('n', '<leader>g', ':Neogit<CR>')
