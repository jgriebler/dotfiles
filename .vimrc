set nocompatible
filetype off

let mapleader = " "
let maplocalleader = ","

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

colorscheme molokai

set autoindent
set showcmd
set cursorline
set relativenumber
set scrolloff=3

set wildmenu
set modelines=0

set ignorecase
set smartcase
set incsearch
set hlsearch

set nobackup
set nowritebackup

nnoremap <CR> :noh<CR>
nnoremap <C-m> <C-]>
nnoremap <Leader>v V`]

nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

syntax on
filetype plugin indent on

let g:haskell_conceal = 0
" let g:haskell_conceal_wide = 1
" let g:haskell_conceal_bad = 1

let g:vim_markdown_folding_disabled = 1
