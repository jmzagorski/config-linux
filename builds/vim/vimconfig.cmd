:: Prerequisites
:: For Visual Studio C++ 2017 x86 build
:: C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat
:: Set environment for wanted options before building Vim.
set GUI=yes
set DYNAMIC_PYTHON=yes
set PYTHON=C:\Program Files (x86)\Python27
set PYTHON_VER=27
set DYNAMIC_PYTHON3=yes
set PYTHON3=C:\Program Files (x86)\Python36-32
set PYTHON3_VER=32
set NETBEANS=no
set FEATURES=HUGE
set CPUNR=i686
set WINVER=0x501
set OLE=no
set OPTIMIZE=SPEED
set CSCOPE=yes
set LIB=%LIB%;C:\Program Files (x86)\Python36-32\Libs
