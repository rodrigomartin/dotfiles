syntax on
autocmd BufNewFile,BufRead *.env set filetype=ignored
set path+=**
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType php setlocal suffixesadd=.php autoindent
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set ruler
set cursorline
set hidden
set colorcolumn=80
set splitbelow splitright
set redrawtime=10000
set foldmethod=indent
set wildmenu
set wildignore+=*/system/*,*/node_modules/*,*/vendor/*

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
"themes
Plug 'morhetz/gruvbox'
call plug#end()

"set theme
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=none

inoremap jj <Esc>
tnoremap <C-[> <C-\><C-N>

let mapleader=" "
noremap <leader>w :w<Cr>

" nav
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

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
