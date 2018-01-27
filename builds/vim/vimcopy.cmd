:: Git
:: clone https://github.com/vim/vim
@set SRC=%USERPROFILE%\builds\vim\src
@set DST=C:\bin\vim\vim80
xcopy %SRC%\runtime "%DST%" /D /E /H /I /Y %*
xcopy %SRC%\src\xxd\xxd.exe "%DST%\*" /D /Y %*
xcopy %SRC%\src\GvimExt\gvimext.dll "%DST%\*" /D /Y %*
xcopy %SRC%\src\*.exe "%DST%\*" /D /Y %*
