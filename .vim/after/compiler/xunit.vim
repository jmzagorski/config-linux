" Vim compiler file
" Compiler:	Microsoft Visual Studio C#
" Maintainer:	Zhou YiChao (broken.zhou@gmail.com)
" Previous Maintainer:	Joseph H. Yao (hyao@sina.com)
" Last Change:	2012 Apr 30
"
" ** changed to dotnet

if exists("current_compiler")
  finish
endif
let current_compiler = "xunit"
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%E%m\ [FAIL],%C%m,%C%m,%C%m,%C%m,%Z%f(%l\\,%v):\ at\ %m
CompilerSet makeprg=dotnet\ xunit\ -nologo


let &cpo = s:keepcpo
unlet s:keepcpo
