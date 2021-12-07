@echo off

@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

cd libimagequant

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2022\x64\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libimagequant\libimagequant.lib %OutputLibDir%
copy libimagequant\libimagequant.h %OutputLibDir%
copy libimagequant\*.pdb %OutputLibDir%

cd libimagequant

nmake -f ..\res\Makefile.msvc clean
nmake -f ..\res\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2022\x64\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy libimagequant\libimagequant.lib %OutputLibDir%
copy libimagequant\libimagequant.h %OutputLibDir%
copy libimagequant\*.pdb %OutputLibDir%

pause
