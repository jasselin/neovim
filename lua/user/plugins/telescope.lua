local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'

telescope.setup {
    defaults = {
        file_ignore_patterns = {"node_modules", ".git/"},
        layout_config = {
            vertical = { width = 0.9, preview_height = 0.65 },
        },
        layout_strategy = "vertical",
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ["<C-h>"] = "which_key"
            }
        },
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
