@echo off

@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

@set SrcDir=libimagequant
@set ResDir=res

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MTd DEBUG=1

cd ..

@set OutputLibDir=build\vs2022\Win32\Debug

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\libimagequant.lib %OutputLibDir%
copy %SrcDir%\libimagequant.h %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%

cd %SrcDir%

nmake -f ..\%ResDir%\Makefile.msvc clean
nmake -f ..\%ResDir%\Makefile.msvc NO_NLS=1 MFLAGS=-MT

cd ..

@set OutputLibDir=build\vs2022\Win32\Release

rmdir /S /Q %OutputLibDir%
mkdir %OutputLibDir%

copy %SrcDir%\libimagequant.lib %OutputLibDir%
copy %SrcDir%\libimagequant.h %OutputLibDir%
copy %SrcDir%\*.pdb %OutputLibDir%

pause
