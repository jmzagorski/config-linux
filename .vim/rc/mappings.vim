" keep the reverse search character since it is the comma and that is my leader
noremap \ ,

" expansion of active dir
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" source vim file so changes are propgated to opened vim
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" remap buffer switching left/right/up/down
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable folding with the spacebar
nnoremap <space> za

"yank from cursors to end of line
nnoremap Y y$

"keep cursor where it is while joining lines
nnoremap J mzJ`z

"center screen after moving
nnoremap n nzz
nnoremap } }zz

"find all occurences of word under cursor
nnoremap K :vimgrep! "\b<cfile>\b"<CR>:cw<CR>

" do nothing
nnoremap <F1> <nop>
nnoremap Q <nop>

" Close the current buffer
map <leader>bd :Bclose<cr>

" switch to last open buffer
nnoremap <leader><leader> :b#<CR>

" easier sorting key stroke in visual mode
xnoremap <C-s> :sort u<CR>
vnoremap // y/<C-R>"<CR>

" semi colin at end of line
inoremap <leader>; <C-o>A;

" shift enter for new line above without insert mode
nmap <S-Enter> O<Esc>

" enter for new line below without insert mode
nmap <CR> o<Esc>

" window sizing if there is one
if bufwinnr(1)
  nnoremap <S-Up> <C-W>+
  nnoremap <S-Down> <C-W>-
  nnoremap <S-Left> <c-w><
  nnoremap <S-Right> <c-w>>
endif

" navigate between tabs tab move to CTRL+Arrow
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
