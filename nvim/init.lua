--- VIMPLUG SETUP ---
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

-- Lualine statusline
Plug 'hoob3rt/lualine.nvim'


-- Telescope and dependencies
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.5' })

-- Fuzzy finder like Control+P in VSCode
-- Plug('junegunn/fzf', { do = { -> fzf#install() } })
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

require('catppuccin').setup({
    transparent_background = true,
})

--- Lualine setup ---
require('lualine').setup {
    options = {
	theme = 'auto',
    },
}

--- CMP COMPLETION SETUP ---
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'

cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),	
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
	{ name = 'buffer' }
    }),
}
---

--- LSP SETUP ---
require'lspconfig'.tsserver.setup{
    on_attach = function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
    end,
}
require'lspconfig'.gopls.setup{
    on_attach = function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
    end,
    settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      usePlaceholders = true,
      staticcheck = true,
      gofumpt = true,
    },
  },
}

--- FORMAT ON SAVE FOR GO FILES ---
vim.cmd([[autocmd FileType go autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

--- ESLINT SETUP ---
require'eslint'.setup({
    bin = 'eslint',
    code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        }
    }
})
---

--- LUALINE SETUP ---
require'lualine'.setup {
  options = {
      theme = 'auto',
  }
}
---

--- TREESITTER SETUP ---
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
---

--- THEME ---
vim.cmd.colorscheme "catppuccin"
---

--- TELESCOPE KEYMAPS ---
-- Find files using Telescope command-line sugar."
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true})
---

--- BUFFER KEYMAPS ---
-- Go to the previous buffer in the buffer list
vim.api.nvim_set_keymap('n', '<C-[>', ':bN<CR>', { noremap = true, silent = true })
-- Go to the next buffer in the buffer list
vim.api.nvim_set_keymap('n', '<C-]>', ':bn<CR>', { noremap = true, silent = true })
---

--- MISC KEYMAPS ---
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })


--- VIM OPTIONS ---
vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.signcolumn = 'yes'
vim.opt.undolevels = 1000
vim.opt.backspace = { 'indent', 'eol', 'start' }
---
