set encoding=utf-8
"automatically highlight matching braces/brackets/etc.
set showmatch 
"tens of a second to show matching parentheses
set matchtime=2 
colorscheme Tomorrow-Night
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

" no lines longer than  cols, with a a bar down the 80th column
set textwidth=80
" make a mark for column 80
set colorcolumn=80

" highlight white space at end of line and anything over 80 lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight ErrorMsg ctermbg=red ctermfg=white guibg=#592929
highlight ExtraWhitespace ctermbg=grey guibg=grey

if has('matchadd')
    :au BufWinEnter * let w:m1=matchadd('ExtraWhitespace', '\s\+$', -1)
    :au BufWinEnter * let w:m2=matchadd('OverLength', '\%>80v.\+', -1)
else
    :au BufRead,BufNewFile * syntax match ExtraWhitespace /\s\+$/
    :au BufRead,BufNewFile * syntax match OverLength /\%>80v.\+/
endif

"function Splitresize()
"    let hmax = max([winwidth(0), float2nr(&columns*0.66), 85])
"    "let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
"    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
"    exe "vertical resize" . (min([hmax, 85]))
"    "exe "vertical resize" . (min([hmax, 140]))
"    "exe "resize" . (min([vmax, 60]))
""    exe "resize" . (min([vmax, 40]))
"endfunction
