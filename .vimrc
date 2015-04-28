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


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'kevinw/pyflakes-vim'
Bundle 'SkidanovAlex/CtrlK'
Bundle 'ManOfTeflon/exterminator'
Bundle 'ManOfTeflon/nerdtree-json'
Bundle 'altercation/vim-colors-solarized'

syntax enable
set background=dark
"colorscheme solarized

" annoying YCM option
let g:ycm_confirm_extra_conf = 0

"let g:ctrlk_clang_library_path="/usr/lib/llvm-3.5/lib"
let g:ctrlk_clang_library_path="/home/vagrant/llvm/lib"
nmap E :call GetCtrlKState()<CR>
nmap <C-k> :call CtrlKNavigateSymbols()<CR>
nmap <F2> :call CtrlKGoToDefinition()<CR>
nmap <F3> :call CtrlKGetReferences()<CR>

" Keybindings for splitting windows
noremap <Leader>v :split<CR>
noremap <Leader>V :vsplit<CR>


" MANDREWS!!!!

nnoremap <F12> :GdbContinue<CR>
nnoremap <F11> :GdbNext<CR>
nnoremap <F10> :GdbStep<CR>
nnoremap <F8>  :GdbToggle<CR>
nnoremap <F6>  :GdbEval<CR>
nnoremap <leader>B :Dbg ./memsqld<CR>

" Keeps cursor still while you scroll
" set scrolloff=999

" Disables beeping noises in VIM
set noeb vb t_vb=

" Move the tmux pane if we're at the edge of the vim window
noremap <Esc>j <C-W>j
noremap <Esc>k <C-W>k
noremap <Esc>h <C-W>h
noremap <Esc>l <C-W>l
nnoremap <silent> <Esc>j :call WindowMotion('h')<cr>
nnoremap <silent> <Esc>k :call WindowMotion('j')<cr>
nnoremap <silent> <Esc>h :call WindowMotion('k')<cr>
nnoremap <silent> <Esc>l :call WindowMotion('l')<cr>
 
function WindowMotion(dir) "{{{
    let dir = a:dir
 
    let old_winnr = winnr()
    execute "wincmd " . dir
    if old_winnr != winnr()
        return
    endif
 
    if dir == 'h'
        let dir = '-L'
    elseif dir == 'j'
        let dir = '-D'
    elseif dir == 'k'
        let dir = '-U'
    elseif dir == 'l'
        let dir = '-R'
    endif
    call system('tmux select-pane ' . dir)
endfunction

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

command! -nargs=0 Sharding Dbg ./memsqld --defaults-file=memsqltest/sharding/memsql.cnf

" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>


set hlsearch
set cursorline

" pathogen and syntastic, a better version of pyflakes
"execute pathogen#infect()
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_python_checkers = ['pyflakes']

" add full path to existing statusline
 set laststatus=2

" show name of function being edited
let Tlist_Process_File_Always=1
set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)
set statusline+=\ %l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
nnoremap <C-t> :TlistToggle<CR>
