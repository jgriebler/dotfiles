set nocompatible

let mapleader = " "
let maplocalleader = ","

" Plugin list {{{
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'neovimhaskell/haskell-vim'
Plug 'idris-hackers/idris-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'Harenome/vim-mipssyntax'
Plug 'rhysd/vim-wasm'
Plug 'ajh17/VimCompletesMe'

call plug#end()
"}}}

colorscheme molokai

" Options {{{
set expandtab
set shiftwidth=4
set softtabstop=4

set list
set listchars=tab:→\ ,trail:·
set autoindent
set cursorline
set relativenumber
set scrolloff=3
set textwidth=80

set laststatus=2
set showcmd
set noshowmode
set ruler

set wildmenu
set modelines=0

set ignorecase
set smartcase
set incsearch
set hlsearch

set hidden

let g:netrw_browsex_viewer = 'firefox'
let g:ranger_replace_netrw = 1
" }}}

" Mappings {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:let @/ = ""<cr>

nnoremap <leader>o :FZF<cr>

nnoremap <leader>i <c-]>
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
nnoremap <leader>v V`]

nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>s <c-w>S<c-w>j
nnoremap <leader>j <c-w>h
nnoremap <leader>k <c-w>j
nnoremap <leader>l <c-w>k
nnoremap <leader>ö <c-w>l
" }}}

" Lightline {{{
let g:lightline = {
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'readonly', 'filename', 'modified' ]
            \   ]
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction
" }}}

" Autocommands {{{
augroup asmsyntax
	au!
	au BufRead,BufNewFile *.asm setlocal filetype=mips
augroup END
" }}}
