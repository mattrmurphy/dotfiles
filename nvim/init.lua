local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Adds a status line at the bottom of the vim window
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.1' })

-- Fuzzy finder like Control+P in VSCode
-- Plug('junegunn/fzf', { do = { -> fzf#install() } })
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Code completion
Plug('neoclide/coc.nvim', { branch = 'release'})

-- Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

-- Language Pack
Plug 'sheerun/vim-polyglot'

-- Go things
-- Plug 'fatih/vim-go'

-- JavaScript Syntax
Plug 'pangloss/vim-javascript'

-- Gruvbox color theme
-- Plug 'morhetz/gruvbox'
-- Catppuccin color theme
Plug('catppuccin/nvim', { as = 'catppuccin' })

vim.call('plug#end')

vim.cmd.colorscheme "catppuccin"

-- Find files using Telescope command-line sugar."
-- TODO: Update second argument based on OS
-- MacOS: <C-p>, Linux: <A-p>
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true})

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.showbreak = +++
vim.opt.showmatch = true
vim.opt.visualbell = true

vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab =  true
vim.opt.softtabstop = 4

vim.opt.ruler = true

vim.opt.undolevels = 1000
vim.opt.backspace = { 'indent', 'eol', 'start' }
