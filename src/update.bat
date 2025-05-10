@echo off
setlocal
set title=[ yt-dlp : update ]
title %title% &echo %title% &echo.

cd /d "%~dp0"
set yt-dlp=%~dp0bin\yt-dlp.exe
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.

"%yt-dlp%" --update-to master

:end
echo.&echo [92m [END] &endlocal&>nul timeout /t 3&exit
rem echo.&echo [92m [END]:pause &endlocal&pause>nul&exit
