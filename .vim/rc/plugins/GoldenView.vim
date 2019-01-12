"Auto resizes buffers
call dein#add('zhaocai/GoldenView.Vim', {
      \ 'on_map':['<Plug>ToggleGoldenViewAutoResize']
      \ })
let g:goldenview__enable_default_mapping=0
nmap <F4> <Plug>ToggleGoldenViewAutoResize
