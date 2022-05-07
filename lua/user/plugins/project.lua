local telescope = require 'telescope'

require('project_nvim').setup {
    patterns = { ".git", ".project" },
}

telescope.load_extension('projects')
