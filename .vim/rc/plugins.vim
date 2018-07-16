" Load all the plugins automatically on startup
" DO NOT NAME THE ~/.vim/plugin, dein does not like it

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

"DO NOT NAME THE DIR PLUGINS. CONFLICTS WITH DEIN
call dein#begin(expand('$HOME/.vim/bundle/')) " plugins' root path

call dein#add('Shougo/dein.vim')

"" FIXME: bug 
if has('win32') || has('win64')
  runtime! plugins/*.vim
else
  runtime! rc/plugins/*.vim
endif

call dein#end()
call dein#save_state()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
