@echo off
if "%1"=="x86" (
	set arch=x86
) else if "%1"=="x64" (
	set arch=x64
) else (
	echo Usage: %~nx0 ^(x86^|x64^)
	exit /B 1
)

set VS100COMNTOOLS=%PROGRAMFILES% (x86)\Microsoft Visual Studio 10.0\Common7\Tools\
call "%PROGRAMFILES% (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

set INCLUDE=%INCLUDE%;%PROGRAMFILES%\Microsoft SDKs\Windows\v7.1\Include
if "%arch%"=="x86" (
	set LIB=%%LIB%%;%PROGRAMFILES%\Microsoft SDKs\Windows\v7.1\Lib
) else if "%arch%"=="x64" (
	set LIB=%%LIB%%;%PROGRAMFILES%\Microsoft SDKs\Windows\v7.1\Lib\x64
)

if "%arch%"=="x86" (
	set OSGEO4W_ROOT=C:\OSGeo4W
) else if "%arch%"=="x64" (
	set OSGEO4W_ROOT=C:\OSGeo4W64
)
call "%OSGEO4W_ROOT%\bin\o4w_env.bat"
path %PATH%;c:\cygwin\bin
doskey cmake-gui="%PROGRAMFILES% (x86)\CMake\bin\cmake-gui.exe"

if "%arch%"=="x86" (
	@set GRASS_PREFIX=c:/OSGeo4W/apps/grass/grass-7.0.1RC1
) else if "%arch%"=="x64" (
	@set GRASS_PREFIX=c:/OSGeo4W64/apps/grass/grass-6.4.3
)
@set INCLUDE=%INCLUDE%;%OSGEO4W_ROOT%\include
@set LIB=%LIB%;%OSGEO4W_ROOT%\lib;%OSGEO4W_ROOT%\lib

@cmd