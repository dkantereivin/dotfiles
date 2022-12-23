-- Adapted from the wonderful gitlab.com/romshshekotov/dotfiles

require('david.plugins')
require('david.keymap')

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'

vim.cmd('syntax enable')
vim.opt.list = true
vim.opt.listchars =  { tab = '▸ ', trail = '·' }
vim.opt.termguicolors = true

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
vim.g['airline_powerline_fonts'] = 1
vim.g['vimtex_view_method'] = 'zathura'

vim.g['UltiSnipsExpandTrigger'] = '<tab>'
vim.g['UltiSnipsJumpForwardTrigger'] = '<c-j>'
vim.g['UltaSnipsJumpBackwardTrigger'] = '<c-k>'
vim.g['UltiSnipsEditSplit'] = 'vertical'

vim.g['ale_fixers'] = {'c', 'css', 'dockerfile', 'gitcommit'}
vim.g['ale_fixers']['c'] = {'clang-format', 'clangd', 'cppcheck', 'gcc'}
vim.g['ale_fixers']['css'] = {'stylelint'}
vim.g['ale_fixers']['dockerfile'] = {'hadolint'}
vim.g['ale_fixers']['gitcommit'] = {'gitlint'}
vim.g['ale_sign_error'] = ''
vim.g['ale_sign_warning'] = ''

vim.g['deoplete#enable_at_startup'] = 1
vim.cmd("call deoplete#custom#option('sources', { '_': ['ale'] })")

vim.g['mkdp_auto_start'] = 1
