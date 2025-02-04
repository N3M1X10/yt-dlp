@echo off
chcp 65001>nul

cd /d "%~dp0"
set ffmpeg=%~dp0bin\ffmpeg.exe

set title=[ ffmpeg : compress ]
title %title% &echo %title% &echo.

:begin
set out=output-compressed.mp4
set size=1920x1080
rem 1920x1080
rem 1280x720
del /q /f "%~dp0%out%"
"%ffmpeg%" -i "%~dp0i.mp4" -s %size% -aspect 16:9 -fpsmax 60 "%~dp0%out%"

:end
echo.&echo [92m [END] &>nul timeout /t 5&exit
