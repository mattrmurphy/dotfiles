local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- LSP Setup
Plug 'neovim/nvim-lspconfig'
-- LSP Autocompletion
Plug 'hrsh7th/nvim-cmp'
-- - Current buffer
Plug 'hrsh7th/cmp-buffer'
-- - Complete file paths
Plug 'hrsh7th/cmp-path'
-- - Builtin LSP
Plug 'hrsh7th/cmp-nvim-lsp'
-- - Snippets Plugin
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'MunifTanjim/eslint.nvim'
Plug 'hoob3rt/lualine.nvim'
-- Telescope and dependencies
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.5' })
-- Fuzzy finder like Control+P in VSCode
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
-- Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
-- Treesitter/highlighting
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
--- THEME PLUGINS --
-- Gruvbox color theme
-- Plug 'morhetz/gruvbox'
-- Catppuccin color theme
Plug('catppuccin/nvim', { as = 'catppuccin' })

vim.call('plug#end')

require('plugins.treesitter')
require('plugins.lspconfig')
require('plugins.cmp')
require('plugins.lualine')
require('plugins.theme')
require('plugins.eslint')

require('config.keymaps')
require('config.options')
require('config.commands')
