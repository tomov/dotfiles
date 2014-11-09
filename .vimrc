" put in home directory, e.g. ~/.vimrc
syntax on
set number
set cindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set nocompatible
" for pyflakes
filetype plugin indent on
set incsearch
set t_Co=256
" Move easily between windows
noremap <Esc>j <C-W>j
noremap <Esc>k <C-W>k
noremap <Esc>h <C-W>h
noremap <Esc>l <C-W>l
" Keybindings for splitting windows
noremap <Leader>v :split<CR>
noremap <Leader>V :vsplit<CR>
" backspace stops working sometimes
set backspace=indent,eol,start
" tab autocompete hellzyeah
imap <tab> <C-n>
