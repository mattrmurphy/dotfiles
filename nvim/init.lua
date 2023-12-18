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

-- Treesitter/highlighting
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})


-- JavaScript Syntax
Plug 'pangloss/vim-javascript'

-- ESLint
Plug 'eslint/eslint'

-- Gruvbox color theme
-- Plug 'morhetz/gruvbox'
-- Catppuccin color theme
Plug('catppuccin/nvim', { as = 'catppuccin' })

vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "javascript", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

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
