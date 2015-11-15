set nocompatible
filetype off

let mapleader = " "
let maplocalleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimproc'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'flazz/vim-colorschemes'

call vundle#end()

colorscheme molokai

map <C-j> <C-]>
nmap <Leader>q @q

set showcmd

syntax on
filetype plugin indent on

set nobackup
set nowritebackup

let g:haskell_conceal = 0
" let g:haskell_conceal_wide = 1
" let g:haskell_conceal_bad = 1

let g:vim_markdown_folding_disabled = 1
