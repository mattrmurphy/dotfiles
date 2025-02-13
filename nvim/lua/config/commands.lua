vim.cmd([[autocmd FileType go autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
