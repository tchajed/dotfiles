command! -nargs=0 WriteMode call WriteMode()
function! WriteMode()
  set lbr
  map j gj
  map k gk
  map $ g$
  map 0 g0
endfunction
