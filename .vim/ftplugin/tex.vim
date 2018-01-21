set expandtab
set shiftwidth=2
set softtabstop=2

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
    \   'envs' : {
    \     'whitelist' : [
    \       'enumerate',
    \       'proof',
    \     ]
    \   },
    \ }

let g:vimtex_imaps_leader = '%'
let g:vimtex_imaps_disabled = [ '0' ]
let g:vimtex_view_method = 'mupdf'

inoremap %0 \varnothing
