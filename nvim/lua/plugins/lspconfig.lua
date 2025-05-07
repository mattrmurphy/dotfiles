require'lspconfig'.ts_ls.setup{}
vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

vim.lsp.enable('ts_ls')

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

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
