" Plugins
    call plug#begin()

    " Themes
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
    "Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'

    " Telescope
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " nvim-cmp
    Plug 'hrsh7th/nvim-cmp'

    " orgmode
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-orgmode/orgmode'

    " deardiary
    Plug 'ishchow/nvim-deardiary'

    " which-key
    Plug 'folke/which-key.nvim'

    " dashboard
    "Plug 'glepnir/dashboard-nvim'

    " Language support
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'plasticboy/vim-markdown'

    call plug#end()

" Appearance
    if (has("termguicolors"))
        set termguicolors
    endif

    syntax on

" Other configs
    set nobackup
    set nowritebackup
    set noswapfile

    set nocompatible
    filetype plugin indent on
    set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab
    set incsearch ignorecase smartcase hlsearch
    set wildmode=longest,list,full wildmenu wildignore=*.swp,*.bak
    set ruler laststatus=2 showcmd showmode
    set nowrap
    set autoindent
    set hidden " Hides buffer instead of unloading
    set number " Line numbers
    set cursorline
    set title  " File in title bar
    set updatetime=300 " Faster refresh
    set clipboard=unnamed

" Key mappings
    let mapleader = " "

    nmap <silent> <leader><leader> :noh<CR>
    nmap <C-Tab> :tabnext<CR>
    nmap <C-S-Tab> :tabprevious<CR>
    nnoremap ; :

" NERDTree
    map <C-n> :NERDTreeToggle<CR>

" NERDCommenter
    nmap <C-k> <Plug>NERDCommenterToggle
    vmap <C-k> <Plug>NERDCommenterToggle<CR>gv

" Telescope
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    :lua require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }

" vimrc shortcut and autoreload
    map <leader>vimrc :tabe $MYVIMRC<CR>
    autocmd bufwritepost init.vim source $MYVIMRC

" vim-markdown
    let g:markdown_fenced_languages = ['javascript', 'bash', 'css']

" dashboard
" let g:dashboard_default_executive ='telescope'

lua << EOF
require('onenord').setup()
require('lualine').setup {
  options = {
    theme = 'onenord'
  }
}
EOF

" orgmode
lua << EOF

 -- Load custom tree-sitter grammar for org filetype
 require('orgmode').setup_ts_grammar()
 
 -- Tree-sitter configuration
 require'nvim-treesitter.configs'.setup {
   -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
   highlight = {
     enable = true,
     disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
     additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
   },
   ensure_installed = {'org'}, -- Or run :TSUpdate org
 }

 require'cmp'.setup({
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
EOF

lua << EOF
local diary_config = require('deardiary.config')
local util = require("deardiary.util")
diary_config.journals = {
    {
            path = "~/Dropbox/org/journal",
            frequencies = {
                daily = {
                    template = function(entry_date)
                    -- Changes template string
                    return entry_date:fmt("# %Y-%m-%d")
                    end,
                    formatpath = function(entry_date)
                    -- Puts all daily entries in one folder instead of
                    -- separating per year and month which is the default
                    return entry_date:fmt(util.join_path({"daily","%Y-%m-%d.org"}))
                    end,
                    },
                }
}
}
EOF

lua << EOF
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Commands
    " Remaps common typos
    :command WQ wq
    :command Wq wq
    :command W w
    :command Q q

" Fixes for French-Canadian keyboard layout
    nnoremap ? ^
    nnoremap é /
