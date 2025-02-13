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
