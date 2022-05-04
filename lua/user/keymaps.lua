-- keymaps.lua

local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', ';', ':')
keymap('n', '<leader>ve', ':tabe $MYVIMRC<CR>')
keymap('n', '<leader>vr', ':source $MYVIMRC<CR>')
