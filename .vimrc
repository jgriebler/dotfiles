set nocompatible
filetype off

let mapleader = " "
let maplocalleader = ","

" Plugin list {{{
call plug#begin()

Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'idris-hackers/idris-vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

call plug#end()
"}}}

colorscheme molokai

" Options {{{
set autoindent
set cursorline
set relativenumber
set scrolloff=3

set laststatus=2
set showcmd
set ruler

set wildmenu
set modelines=0

set ignorecase
set smartcase
set incsearch
set hlsearch

set nobackup
set nowritebackup
" }}}

" Mappings {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

noremap H ^
noremap L $

nnoremap <leader>c :let @/ = ""<cr>
nnoremap <c-m> <c-]>
nnoremap <leader>v V`]

nnoremap <leader>w <c-w>v<c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" }}}
