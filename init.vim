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
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    "luasnip
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

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
    Plug 'pprovost/vim-ps1'

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
    "
" nvim-cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
EOF
"
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
