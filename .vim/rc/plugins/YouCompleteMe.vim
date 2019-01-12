call dein#add('Valloric/YouCompleteMe', { 'build': 'python3 ./install.py' })
call dein#add('rust-lang/rust')

let g:ycm_rust_src_path = "$HOME/.cache/dein/repos/github.com/rust-lang/rust/src"
nnoremap <Leader>] :YcmCompleter GoTo<CR>
