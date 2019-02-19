nnoremap <localleader>c :CoqLaunch<cr>
nnoremap <localleader>n :CoqNext<cr>
nnoremap <localleader>u :CoqUndo<cr>
nnoremap <localleader>t :CoqToCursor<cr>

inoremap <c-f> <c-o>:CoqToCursor<cr>

hi CheckedByCoq                              cterm=italic
hi SentToCoq                    ctermbg=233
hi CoqError        ctermfg=196               cterm=bold
