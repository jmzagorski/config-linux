call dein#add('vim-scripts/dbext.vim', {'on_ft':['sql']})
let g:dbext_default_profile_MSSQLDEV = 'type=SQLSRV:integratedlogin=1:srvname=(localdb)\ProjectsV12'
let g:dbext_default_profile = 'MSSQLDEV'
