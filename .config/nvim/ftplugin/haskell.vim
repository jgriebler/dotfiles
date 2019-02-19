setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal conceallevel=0

augroup cleanup
	au!
	au VimEnter * setlocal foldmethod=manual
augroup END

let g:haskell_conceal       = 0
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:haskell_hsp           = 0
