" Tips
" :help {something}
" set {something}?
"
" set off highlighting in underscore
" https://stackoverflow.com/questions/19137601/turn-off-highlighting-a-certain-pattern-in-vim
" :hi link markdownError Normal

syntax on
set path+=**
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set ruler
set cursorline
set colorcolumn=80
let mapleader=" "

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox
set background=dark

" Save|quit
noremap <leader>w :w<Cr>
noremap <leader>q :bd<Cr>

" File Explorer 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Ctrl+P 
nnoremap <C-p> :FZF<CR>

" Buffers navigation 
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
