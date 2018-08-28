call dein#local('~/.vim/bundle/repos/vim.org', {'on_ft':['sql']}, ['dbext'])

let g:dbext_default_profile_MSSQLDEV = 'type=SQLSRV:integratedlogin=1:srvname=""(localdb)\MSSQLLocalDb"""'
let g:dbext_default_profile_MSSQLSTAGE = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLSTAGE')
let g:dbext_default_profile_EMGSQLSTAGE = expand('type=SQLSRV:integratedlogin=1:srvname=$EMGSQLSTAGE')
let g:dbext_default_profile_MSSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLPROD')
let g:dbext_default_profile_ESDSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$MSSQLPRODESD')
let g:dbext_default_profile_EMGSQLPROD = expand('type=SQLSRV:integratedlogin=1:srvname=$EMGSQLPROD')
let g:dbext_default_SQLSRV_bin="sqlcmd"
let g:dbext_default_profile = 'MSSQLDEV'
let g:dbext_default_SQLSRV_cmd_options = ''
let g:dbext_default_job_enable=0
