" Plugins
    call plug#begin()

    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    call plug#end()

" Appearance
    if (has("termguicolors"))
        set termguicolors
    endif

    syntax enable
    color dracula
    let g:airline_theme='dracula'

" Other configs
    set nobackup
    set nowritebackup
    set noswapfile

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

" Key mappings
    let mapleader = "\<Space>"

    nmap <silent> <leader><leader> :noh<CR>
    nmap <C-Tab> :tabnext<CR>
    nmap <C-S-Tab> :tabprevious<CR>
    nnoremap ; :

" NERDTree
    map <C-n> :NERDTreeToggle<CR>

" NERDCommenter
    nmap <C-k> <Plug>NERDCommenterToggle
    vmap <C-k> <Plug>NERDCommenterToggle<CR>gv

" CoC
    set cmdheight=2
    set shortmess+=c

    if has("nvim-0.5.0") || has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Telescope
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vimrc shortcut and autoreload
    map <leader>vimrc :tabe $MYVIMRC<CR>
    autocmd bufwritepost init.vim source $MYVIMRC

" Commands
    " Remaps common typos
    :command WQ wq
    :command Wq wq
    :command W w
    :command Q q

" Fixes for French-Canadian keyboard layout
    nnoremap ? ^
    nnoremap é ?