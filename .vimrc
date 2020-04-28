syntax on
set number
set cindent
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set laststatus=2
set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set ruler

set nocompatible
filetype plugin indent on

set incsearch
set hlsearch
set t_Co=256

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on

Bundle 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-obsession'
Bundle '907th/vim-auto-save'

let g:auto_save = 1 " enable AutoSave 

cmap vsplit vs

" arrow keys
noremap t j
noremap n k
noremap s l
noremap <Del> d

" next search, b/c remapped n above
noremap j n
