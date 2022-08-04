call plug#begin()
"Adds a status line at the bottom of the vim window"
Plug 'vim-airline/vim-airline'

"Fuzzy finder like Control+P in VSCode"
Plug 'ctrlpvim/ctrlp.vim'

"Code completion"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Indent Guides"
Plug 'nathanaelkane/vim-indent-guides'

"Language Pack"
Plug 'sheerun/vim-polyglot'

"Go things"
Plug 'fatih/vim-go'

"JavaScript Syntax"
Plug 'pangloss/vim-javascript'

"Gruvbox color theme"
Plug 'morhetz/gruvbox'

call plug#end()

set number
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
