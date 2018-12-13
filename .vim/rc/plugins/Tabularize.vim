call dein#add('godlygeek/tabular')

function! AlignSqlTable()
  :Tabularize /\v\s(,\s|"[^"]*")("[^"]*"|[A-Za-z]*)\zs
  :Tabularize /\v\([^\)]*\)
  :Tabularize /\v(not null|null)
endfunction
