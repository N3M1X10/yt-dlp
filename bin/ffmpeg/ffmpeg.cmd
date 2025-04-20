@echo off
setlocal
chcp 65001>nul
cd /d "%~dp0"
set ffmpeg=%~dp0bin\ffmpeg.exe

:ask
set /p arg=Enter command: 
"%ffmpeg%" %arg%
echo.&goto ask