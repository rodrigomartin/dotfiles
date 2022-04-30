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
noremap <leader>q :call ExecuteQuery()<Cr>

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

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Execute queries in mysql
function! ExecuteQuery() abort
  execute "normal! ?;\<cr>" | let l:ini = getpos('.')
  execute "normal! /;\<cr>" | let l:end = getpos('.')

  if l:ini[1] >= l:end[1]
    let l:ini = [bufname(), 1, 1, 0, 1]
  else
    let l:ini[1] = l:ini[1]+1
  endif

  " Query
  let l:startpos   = l:ini[1]
  let l:endpos     = l:end[1]
  let l:queryfile  = tempname()
  let l:querylines = getline(l:startpos, l:endpos)
  call writefile(l:querylines, l:queryfile)

  " connection
  let l:container    = "mysql"
  let l:dbname       = "pleno"
  let l:user         = "root"
  let l:connection   = l:container != "" ? "docker exec -i ".l:container : ""
  let l:command      = l:connection." mysql -u".l:user." ".l:dbname
  let l:queryresult  = system(l:command." < ".l:queryfile." | sed 's/\\t/;/g'")
  let l:resultslines = split(l:queryresult, '\n')

  " logs
  let l:loglines = []
  let l:loglines = add(l:loglines, "ini: ".join(l:ini))
  let l:loglines = add(l:loglines, "end: ".join(l:end))
  let l:loglines = add(l:loglines, "command: ".l:command)
  let l:loglines = add(l:loglines, "[Query]: ")

  execute ":new|setlocal bufhidden=wipe buftype=nofile noswapfile nobuflisted"
  for line in l:querylines
    let l:loglines = add(l:loglines, line)
  endfor
  if empty(l:resultslines) 
    call append(0, l:loglines)
  elseif l:resultslines[0] == "ERROR"
    call append(0, l:queryresult)
    call append(line("$"), l:loglines)
  else
    call append(0, l:resultslines)
    execute ":%!column -s ';' -t"
  endif
  call delete(l:queryfile)
endfunction
