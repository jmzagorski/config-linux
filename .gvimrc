" hide unnecessary gui in gVim
if &t_Co > 2 || has("gui_running")
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set hlsearch
  if has('gui_win32')
    set guifont=Fira_Code:h11
  else
    set guifont=Fira\ Code\ 11
  endif
  if !has('windows')
    set transparency=2 " does not work on windows
  endif

  " if windows...
  if has('win32') || has('win64')
      " start maximized
      autocmd GUIEnter * simalt ~x
  endif

else
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set background=dark
let g:solarized_termcolors=16
" terminal color
set t_Co=16
silent! colorscheme apprentice

set noerrorbells
set vb t_vb=
