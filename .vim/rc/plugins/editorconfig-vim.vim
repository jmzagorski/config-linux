call dein#add('editorconfig/editorconfig-vim')

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

if has('win32') || has('win64')
  let g:EditorConfig_exec_path = expand('$PROGRAMDATA\chocolatey\lib\editorconfig.core\tools\editorconfig.exe')
endif
