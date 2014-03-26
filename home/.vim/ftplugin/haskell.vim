"""""""""""""""""""""""""""""""
" Haskell
"""""""""""""""""""""""""""""""

"Ghc-mod type information
map <silent><localleader>t :GhcModType<CR>
map <silent><localleader>c :GhcModTypeClear<CR>
map <silent><localleader>i :GhcModTypeInsert<CR>

"Activate neco-ghc
setlocal omnifunc=necoghc#omnifunc
