" Load all the plugins automatically on startup

filetype off
filetype plugin indent off

" i put plugin overrides here for Ultisnips
" plus i think this is the default location for linux
if has('win32') || has('win64')
  set runtimepath+=$HOME/.vim/after
endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim/

  "" FIXME: bug 
  if has('win32') || has('win64')
    set runtimepath+=$HOME/.vim/rc
  else
    set runtimepath+=$HOME/.vim/rc/plugins/
  endif

endif

call dein#begin(expand('$HOME/.vim/bundle/')) " plugins' root path

call dein#add('Shougo/dein.vim')

"" FIXME: bug 
if has('win32') || has('win64')
  runtime! plugins/*.vim
else
  runtime! rc/plugins/*.vim
endif

call dein#end()

filetype plugin indent on
syntax on

if dein#check_install()
  call dein#install()
endif
