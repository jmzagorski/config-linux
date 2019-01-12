call dein#add('junegunn/fzf', { 'build': './install --all'})
call dein#add('junegunn/fzf.vim')

nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
