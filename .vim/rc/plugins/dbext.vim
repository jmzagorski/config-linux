call dein#add('vim-scripts/dbext.vim', {'on_ft':['sql']})
" TODO make this a variable
let g:dbext_default_profile_MSSQLDEV = 'type=SQLSRV:integratedlogin=1:srvname=""(localdb)\MSSQLLocalDb"""'
let g:dbext_default_profile_MSSQLSTAGE = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLSTAGE')
let g:dbext_default_profile_MSSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLPROD')
let g:dbext_default_profile_ESDSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLPRODESD')
let g:dbext_default_profile_EMGSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$EMGSQLPROD')
let g:dbext_default_SQLSRV_bin="sqlcmd"  
let g:dbext_default_profile = 'MSSQLDEV'
