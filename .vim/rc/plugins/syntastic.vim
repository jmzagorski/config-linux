call dein#add('scrooloose/syntastic')
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "∆"
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_typescript_checkers=['tslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cs_checkers = ['code_checker']
nmap <leader>sc :SyntasticCheck<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn