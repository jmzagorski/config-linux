:: Git
:: clone https://github.com/vim/vim
:: make sure you change the version on the folder
:: mklink /D %ProgramFiles(x86)%\vim\runtime %ProgramFiles(x86)%\vim\<version>
:: last itme it only worked when i actually ran gvim.exe from the runtime dir
@set SRC=%USERPROFILE%\builds\vim\src
@set DST=%USERPROFILE%\vim\vim81
xcopy %SRC%\runtime "%DST%" /D /E /H /I /Y %*
xcopy %SRC%\src\xxd\xxd.exe "%DST%\*" /D /Y %*
xcopy %SRC%\src\GvimExt\gvimext.dll "%DST%\*" /D /Y %*
xcopy %SRC%\src\*.exe "%DST%\*" /D /Y %*
