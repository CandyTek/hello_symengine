@echo off
chcp 65001 >nul
:: Use vswhere to find the latest VS installation path
set PATH=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer;%PATH%
set PATH=D:\Download3\ninja-win;%PATH%
for /f "usebackq tokens=*" %%i in (`call "%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
    set VS_PATH=%%i
)

:: call VsDevCmd.bat
call "%VS_PATH%\Common7\Tools\VsDevCmd.bat"

cmake -S . -B cmake-build-debug-visual-studio -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Debug
