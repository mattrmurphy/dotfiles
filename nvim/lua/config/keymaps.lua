--- TELESCOPE KEYMAPS ---
-- Find files using Telescope command-line sugar."
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
-- Live grep files
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true })
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
