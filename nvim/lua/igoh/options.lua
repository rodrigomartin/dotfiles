vim.cmd 'syntax on'
vim.opt.path:append('**')
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.wrap=false
vim.opt.ruler=true
vim.opt.cursorline=true
vim.opt.hidden=true
--vim.opt.colorcolumn='80'
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.redrawtime=10000
vim.opt.foldmethod='indent'
vim.opt.wildmenu=true
vim.opt.wildignore:append('*/system/*,*/node_modules/*,*/vendor/*')
vim.opt.mouse='a'

-- autocmds
vim.cmd 'autocmd BufNewFile,BufRead *.env set filetype=ignored'
vim.cmd 'autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2'
vim.cmd 'autocmd FileType php setlocal suffixesadd=.php autoindent'

vim.cmd [[set iskeyword+=-]]
-- vim.cmd 'set whichwrap+=<,>,[,],h,l'
