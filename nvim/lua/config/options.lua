local options = {
  number = true,
  relativenumber = true,
  showmatch = true,
  visualbell = true,
  hlsearch = true,
  smartcase = true,
  ignorecase = true,
  incsearch = true,
  ruler = true,
  signcolumn = 'yes',
  undolevels = 1000,
  backspace = { 'indent', 'eol', 'start' },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
