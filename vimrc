set nocompatible
filetype off
set number
syntax on

" Something to do with colours.
hi Search cterm=NONE ctermfg=white ctermbg=lightblue

" I think this is where temp files are automatically saved?? Not sure.
set directory^=$HOME/.vim/tmp//

" This just makes backspace work better in certain situations.
set backspace=indent,eol,start

" Maps jumping across split Vim panes.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sets up a working directory.
set autochdir

" Sets nice vertical and horizontal highlighting lines where your cursor is.
set cursorline
hi CursorLine cterm=NONE ctermbg=darkblue
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=magenta guibg=darkred guifg=white

" Sets up nice tabbing.
set expandtab
set shiftwidth=2
set softtabstop=2

" Enables you to save stuff to the system's clipboard to copy and paste it.
set clipboard=unnamed
" You only copy text and not numbers.
set mouse=a

" PLUGINs - I think I use vim-plug as my plugin manager?
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
Plug 'mattreduce/vim-mix'
Plug 'elixir-editors/vim-elixir'
call plug#end()

let mapleader=','

map <leader>d :NERDTreeToggle<CR>

" If you press enter on a word, all identical words will be highlighted.
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" Makes file you're currently on the working dir for nerdtree so that a new
" file opens in the same place.
autocmd BufEnter * lcd %:p:h
