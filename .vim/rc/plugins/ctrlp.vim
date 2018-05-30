call dein#add('ctrlpvim/ctrlp.vim')
let g:ctrlp_map='<c-f>'
let g:ctrlp_custom_ignore = 'test\coverage|node_modules\|DS_Store\|git|bin\|obj\|wwwroot\'

 let g:ctrlp_prompt_mappings = {
   \ 'PrtBS()':      ['<c-h>'],
   \ 'PrtCurLeft()': ['<left>'],
\ }
