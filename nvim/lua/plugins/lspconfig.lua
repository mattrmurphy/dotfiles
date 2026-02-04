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

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  -- Sets the "workspace" to the directory where any of these files is found.
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    ".git",
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
	  diagnostics = {
		  globals = { "vim" }
	  }
    }
  }
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')

vim.lsp.config('gopls', {
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
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
