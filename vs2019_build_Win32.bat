@echo off

@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"

cd libimagequant

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2019\Win32\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libimagequant\libimagequant.lib %OutputLibDir%
copy libimagequant\libimagequant.h %OutputLibDir%
copy libimagequant\*.pdb %OutputLibDir%

cd libimagequant

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2019\Win32\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libimagequant\libimagequant.lib %OutputLibDir%
copy libimagequant\libimagequant.h %OutputLibDir%
copy libimagequant\*.pdb %OutputLibDir%

pause
