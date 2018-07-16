" MUST BE BEFORE THE COLOR HIGHLIGHTING WHEN NOT USING MATCH
syntax on
set encoding=utf-8
"automatically highlight matching braces/brackets/etc.
set showmatch 
"tens of a second to show matching parentheses
set matchtime=2 

" highlight white space at end of line and anything over 80 lines
" MUST BE PUT BEFORE COLORSCHEME
:au ColorScheme * highlight OverLength ctermbg=NONE ctermfg=lightgray guibg=#592929
:au ColorScheme * highlight ErrorMsg ctermbg=red ctermfg=black guibg=#592929
:au ColorScheme * highlight ExtraWhitespace ctermbg=lightgray guibg=#592929

if has('matchadd')
  :au BufWinEnter * let w:m1=matchadd('ExtraWhitespace', '\s\+$', -1)
  :au BufWinEnter * let w:m2=matchadd('OverLength', '\%>80v.\+', -1)
else
  :au BufRead,BufNewFile * syntax match ExtraWhitespace /\s\+$/
  :au BufRead,BufNewFile * syntax match OverLength /\%>80v.\+/
endif

colorscheme gruvbox
" show line numbers
set number
set lazyredraw
set laststatus=2
set noshowmode
"enable folds by default
set foldenable
"fold via syntax of files
set foldmethod=syntax
"open all folds by default
set foldlevelstart=99
set foldnestmax=10
set foldlevel=2
let g:xml_syntax_folding=1                          "enable xml folding

set timeoutlen=200
set ttimeoutlen=200

set mouse=a                                         "enable mouse
set mousehide                                       "hide when characters are typed
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility

" auto wrap lines at 80
"set textwidth=80
" make a mark for column 80
set colorcolumn=80


"" Terminal setttings {{{
if !has("gui_running")
  set noerrorbells novisualbell t_vb=
  set termencoding=utf8
  set term=xterm
  set t_ut= " setting for looking properly in tmux
  set t_BE= " disable bracketed-paste mode
  let &t_Co = 256
  " del key will be backspace, so stop that from happening
  inoremap <Char-0x07F> <BS>
  nnoremap <Char-0x07F> <BS>
  " src: https://conemu.github.io/en/VimXterm.html
  " trick to support 256 colors and scroll in conemu
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  inoremap <esc>[62~ <c-x><c-e>
  inoremap <esc>[63~ <c-x><c-y>
  nnoremap <esc>[62~ 3<c-e>
  nnoremap <esc>[63~ 3<c-y>
  if has('win32') || has('win64')
    " this gets rid of funng characters
    !chcp 65001
  endif
endif
