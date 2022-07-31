local opt = vim.opt
local cmd = vim.cmd

cmd "syntax on"
cmd "autocmd BufNewFile,BufRead *.env set filetype=ignored"
cmd "autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2"
cmd "autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2"
cmd "autocmd FileType php setlocal suffixesadd=.php autoindent"

opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.smartindent=true
opt.number=true
opt.relativenumber=true
opt.wrap=false
opt.ruler=true
opt.cursorline=true
opt.hidden=true
opt.splitbelow=true
opt.splitright=true
opt.foldmethod="indent"
opt.mouse="a"
opt.swapfile=false
opt.colorcolumn="80"

--
-- opt.redrawtime=10000
-- opt.wildmenu=true
-- opt.wildignore:append("*/system/*,*/node_modules/*,*/vendor/*")