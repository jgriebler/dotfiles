set nocompatible
filetype off

let mapleader = " "
let maplocalleader = ","

" Plugin list {{{
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'dag/vim2hs'
Plug 'idris-hackers/idris-vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'Harenome/vim-mipssyntax'

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

let g:netrw_browsex_viewer = 'firefox'
" }}}

" Mappings {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:let @/ = ""<cr>

nnoremap <leader>f <c-]>
nnoremap <leader>r <c-t>

nnoremap <leader>y "+y
nnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+P

vnoremap <leader>y "+y
vnoremap <leader>d "+d
vnoremap <leader>p "+p
vnoremap <leader>P "+P

noremap H ^
noremap L $

inoremap <m-space> <esc>

nnoremap <silent> <leader><leader> :let @/ = ""<cr>
nnoremap <c-m> <c-]>
nnoremap <leader>v V`]

nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>s <c-w>S<c-w>j
nnoremap <leader>j <c-w>h
nnoremap <leader>k <c-w>j
nnoremap <leader>l <c-w>k
nnoremap <leader>ö <c-w>l
" }}}

" Autocommands {{{
augroup asmsyntax
	au!
	au BufRead,BufNewFile *.asm setlocal filetype=mips
augroup END
" }}}
