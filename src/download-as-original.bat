@echo off
chcp 65001>nul
setlocal

:: params
cd /d "%~dp0"
set yt-dlp=%~dp0bin\yt-dlp.exe

set title=[ yt-dlp : download as original format ]
title %title% &echo %title% &echo.

:begin
set /p url=[92mEnter video URL: [0m
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.


"%yt-dlp%" -P downloaded\original\ "%url%"

:end
echo.&echo [92m [END] &endlocal&>nul timeout /t 3&exit
rem echo.&echo [92m [END]:pause &endlocal&pause>nul&exit