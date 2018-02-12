call dein#add('OmniSharp/omnisharp-vim', {'on_ft':['cs','csharp']})

" OmniSharp won't work without this setting
filetype plugin on

let g:OmniSharp_selecter_ui = 'ctrlp'

" dont start automatically, which find a solution file, this wont allow
" multiple solutions. use the path instead
let g:Omnisharp_stop_server = 0

" for some reason it was not finding the correct file. my win64 has .cmd, but
" the autoload/OmniSharp/util.vim does not use that, wtf?
" FIXME
let g:OmniSharp_server_path= expand('$HOME/.vim/bundle/repos/github.com/OmniSharp/omnisharp-vim/omnisharp-roslyn/artifacts/scripts/OmniSharp.Http.cmd')

"exec '!' . g:OmniSharp_server_path -s s:get_profile_path(expand('%:p:h'))

set completeopt=preview
let g:OmniSharp_want_snippet=1

"makes enter work like C-y, confirming a popup selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" rosyln configs
let g:OmniSharp_server_type = 'roslyn'

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
setlocal omnifunc=OmniSharp#Complete
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
" Builds can also run asynchronously with vim-dispatch installed
nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>

nnoremap <leader>fm :OmniSharpFindMembers<cr>
" cursor can be anywhere on the line containing an issue
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>fx :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
"navigate up by method/property/field
nnoremap <leader>k :OmniSharpNavigateUp<cr>
"navigate down by method/property/field
nnoremap <leader>j :OmniSharpNavigateDown<cr>

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rs :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

nnoremap <leader>rt :OmniSharpRunTests<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr>

augroup omnisharp_commands
  autocmd!

  command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  " automatic syntax check on events (TextChanged requires Vim 7.4)
  autocmd BufEnter,TextChanged,InsertLeave *.cs,*.cshtml SyntasticCheck

  " Automatically add new cs files to the nearest project on save
  "
  autocmd BufWritePost *.cs,*.cshtml call OmniSharp#AddToProject()

  "show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs,*.cshtml call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
