call dein#add('vim-scripts/dbext.vim', {'on_ft':['sql']})
let g:dbext_default_profile_MSSQLDEV = 'type=SQLSRV:integratedlogin=1:srvname=(localdb)\ProjectsV12'
let g:dbext_default_profile_MSSQLSTAGE = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLSTAGE')
let g:dbext_default_profile_MSSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLPROD')
let g:dbext_default_SQLSRV_bin="sqlcmd"  
let g:dbext_default_profile = 'MSSQLDEV'
