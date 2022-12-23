vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>f', ':CtrlPMixed<CR>')
vim.keymap.set('n', '<esc><esc>', ':nohls<CR>', { silent = true })

vim.keymap.set('n', '<leader>.', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')

vim.keymap.set('n', '<leader>h', '<C-W>h')
vim.keymap.set('n', '<leader>j', '<C-W>j')
vim.keymap.set('n', '<leader>k', '<C-W>k')
vim.keymap.set('n', '<leader>l', '<C-W>l')

