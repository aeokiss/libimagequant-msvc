@echo off

@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

cd libimagequant

nmake -f ..\res\Makefile.msvc clean

cd ..

pause
