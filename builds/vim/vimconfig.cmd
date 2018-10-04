:: Prerequisites (see INSTALLpc.txt on vim repo for more info)
:: For Visual Studio C++ 2017 x86 build
:: Steps
:: 1. open vscmd prompt
:: 2. run "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat"
:: 3. Set config options and run ..\..\vimconfig.cmd from with src\src of vim dir
:: 4. nmake -f Make_mvc.mak
:: 5. Run ..\..\vimcopy.cmd from with src\src of vim dir
:: 6. Run nmake -f Make_mvc.mak clean
:: 7. Run from step 3 for gvim/vim, whichever was not done.
set GUI=yes
set DYNAMIC_PYTHON=yes
set PYTHON=C:\Program Files (x86)\Python27
set PYTHON_VER=27
set DYNAMIC_PYTHON3=yes
set PYTHON3=%LOCALAPPDATA%\Programs\Python\Python36-32
set PYTHON3_VER=32
set NETBEANS=no
set FEATURES=HUGE
set CPUNR=i686
set WINVER=0x501
set OLE=no
set OPTIMIZE=SPEED
set CSCOPE=yes
set LIB=%LIB%;%LOCALAPPDATA%\Programs\Python\Python36-32\Libs
set DYNAMIC_RUBY=yes
set RUBY=C:\Ruby25-x64
set RUBY_VER=25
set RUBY_API_VER_LONG=2.5.0
