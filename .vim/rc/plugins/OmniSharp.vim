call dein#add('OmniSharp/omnisharp-vim', {'on_ft':['cs','csharp']})

" OmniSharp won't work without this setting
filetype plugin on

let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_path= expand('$OMNISHARP')
" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1
let g:OmniSharp_selecter_ui = 'ctrlp'
let g:Omnisharp_stop_server = 1  " Ask whether to stop the server on exit
set completeopt=longest,menuone,preview
" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5
let g:OmniSharp_want_snippet=1
let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    " Automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>ft :OmniSharpFindType<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    " Cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <leader>k :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <leader>j :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (requires fzf, CtrlP or unite.vim)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Load the current .cs file to the nearest project
nnoremap <Leader>tp :OmniSharpAddToProject<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=1
