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
set hidden
set colorcolumn=80
set splitbelow splitright

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox
set background=dark

inoremap jj <Esc>
tnoremap <C-[> <C-\><C-N>

let mapleader=" "
noremap <leader>w :w<Cr>
noremap <leader>q :bd<Cr>
noremap <leader>j :new term://zsh<Cr>

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
