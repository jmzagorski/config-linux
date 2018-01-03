" ---------------------- FROM VIM 80 Exmaple ----------------------
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
    set undodir="$HOME/.vim/tmp"
  endif
endif

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
" ----------------------------------------------------------------

let mapleader = ','
let g:mapleader = ','
set lazyredraw                               " don't redraw while executing macros
set fileformats=unix,mac,dos                 " Automatic end-of-file format detection
"set autoindent                              " automatic indent new lines
set smartindent                              " be smart about it
set expandtab                                " expand tabs to spaces
set smarttab                                 " no tabs
set tabstop=2
"important: keep next 2 lines the same values for spaces
set softtabstop=2                            " backspace will have same behavior
set shiftwidth=2                             " when pressing the < and > key
set backspace=indent,eol,start               " Allow backspacing over everything in insert mode
set clipboard^=unnamed,unnamedplus           " sync with clipboard
set hidden                                   " allow buffer switching without saving
set autoread                                 " reload files changed outside vim 
set showcmd
set tags=tags;/
set showfulltag
set modeline
set modelines=5
set visualbell t_vb=                         " No beep sound
set noerrorbells
set novisualbell
set history=1000                             " number of command lines to remember default is 20
" ---------------------- SEARCHING ----------------------
set ignorecase
set smartcase
set noswapfile
set incsearch
" hlsearch is in .gvimrc
" enable menu at bottom of window (e.g. colorscheme <Tab>)
set wildmenu
set wildmode=list:longest,full
" makes vimgrep and searches faster since these are normally not
" your code
set wildignore+=*/node_modules/*
set wildignore+=*/obj/*
set wildignore+=*/jspm_packages/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.mimosa
" ---------------------- END SEARCHING ----------------------
set exrc
set secure
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set virtualedit=block
" on vert split split belo
set splitbelow
" on horizontal split, split right
set splitright
set linebreak
au BufRead *.spark set filetype=html
" TODO list
"command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
" faster, but requires act plugin
" command prompt in windows vs linux
if has('win32') || has('win64')
  command! Todo Ack! "TODO | FIXME"
else
  command! Todo Ack! 'TODO\|FIXME'
endif

" ---------------------- BACKUPS ----------------------
" Save your backup files to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or .
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swap files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backup files, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
