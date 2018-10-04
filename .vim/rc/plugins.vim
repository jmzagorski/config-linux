" Load all the plugins automatically on startup
" DO NOT NAME THE ~/.vim/plugin, dein does not like it
if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.vim/after

if has('win32') || has('win64')
  set runtimepath+=~/.vim/rc
else
  set runtimepath+=~/.vim/rc/plugins/
endif

"if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/dein.vim')

  "" FIXME: bug 
  if has('win32') || has('win64')
    runtime! plugins/*.vim
  else
    runtime! rc/plugins/*.vim
  endif

 call dein#end()
 call dein#save_state()
"endif

filetype plugin indent on
syntax enable

runtime macros/matchit.vim
