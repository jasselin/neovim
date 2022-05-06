-- local telescope = require 'telescope'
-- local actions = require 'telescope.actions'
-- local keymap = require 'lib.utils'.keymap


-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require('nvim-treesitter.configs').setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('cmp').setup({
    sources = {
        { name = 'orgmode' }
    }
})

require('orgmode').setup({
    org_agenda_files = {'~/Dropbox/org/**/*'},
    org_default_notes_file = '~/Dropbox/org/inbox.org',
    org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'WAIT(w)', '|', 'DONE(d)', 'KILL(k)'},
    org_todo_keyword_faces = {
        WAIT = ':foreground orange',
        KILL = ':foreground red',
        NEXT = ':foreground cyan',
        DONE = ':foreground grey'
    },
    org_hide_leading_stars = true
})

vim.cmd [[
    augroup orgmode
        au!
        autocmd Syntax org setlocal foldmethod=manual
    augroup END
]]
