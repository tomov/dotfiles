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
filetype plugin indent on

set incsearch
set t_Co=256

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on

Bundle 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-tmux-navigator'

