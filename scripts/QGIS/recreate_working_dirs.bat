@echo off
set root_dir=%~dp0
if "%1"=="x86" (
	set arch=x86
) else if "%1"=="x64" (
	set arch=x64
) else (
	echo Usage: %~nx0 ^(x86^|x64^)
	exit /B 1
)

set build_dir="%root_dir%build\%arch%"
set app_dir="%root_dir%app\%arch%"

if exist "%build_dir%\" (
	rmdir /S /Q "%build_dir%"
)
mkdir "%build_dir%"

if exist "%app_dir%\" (
	rmdir /S /Q "%app_dir%"
)
mkdir "%app_dir%"