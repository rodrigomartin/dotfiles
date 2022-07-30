-- GENERAL
vim.cmd "syntax on"
vim.opt.path:append("**")
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
--vim.opt.colorcolumn="80"
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.redrawtime=10000
vim.opt.foldmethod="indent"
vim.opt.wildmenu=true
vim.opt.wildignore:append("*/system/*,*/node_modules/*,*/vendor/*")
vim.opt.mouse="a"
vim.opt.swapfile=false

-- AUTOCMDS
vim.cmd "autocmd BufNewFile,BufRead *.env set filetype=ignored"
vim.cmd "autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2"
vim.cmd "autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2"
vim.cmd "autocmd FileType php setlocal suffixesadd=.php autoindent"

--
-- THEME
-- vscode:
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[colorscheme vscode]])

-- material
--vim.cmd([[colorscheme material]])
--

-- STATUS LINE
require('lualine').setup{
    sections = {
        lualine_c = {
            { 'filename', path=1 }
        },
    }
}

-- WSL yank support
vim.cmd [[
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
]]
