call plug#begin()
"Adds a status line at the bottom of the vim window"
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

"Fuzzy finder like Control+P in VSCode"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Code completion"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Indent Guides"
Plug 'nathanaelkane/vim-indent-guides'

"Language Pack"
Plug 'sheerun/vim-polyglot'

"Go things"
"Plug 'fatih/vim-go'"

"JavaScript Syntax"
Plug 'pangloss/vim-javascript'

"Gruvbox color theme"
"Plug 'morhetz/gruvbox'"
"Catppuccin color theme"
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" Find files using Telescope command-line sugar.
nnoremap <A-p> <cmd>Telescope find_files<cr>

set number
set relativenumber
set showbreak=+++
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set ruler
 
set undolevels=1000
set backspace=indent,eol,start
