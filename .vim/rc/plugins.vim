" Load all the plugins automatically on startup

filetype off
filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim/
  set runtimepath+=$HOME/.vim/rc/plugins/
endif

call dein#begin(expand('$HOME/.vim/bundle/')) " plugins' root path

call dein#add('Shougo/dein.vim')

runtime! rc/plugins/*.vim

call dein#end()

filetype plugin indent on
syntax on

if dein#check_install()
  call dein#install()
endif
