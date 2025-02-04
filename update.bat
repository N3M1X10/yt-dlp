@echo off
setlocal
set title=[ yt-dlp : update ]
title %title% &echo %title% &echo.
set yt-dlp=%~dp0bin\yt-dlp\yt-dlp.exe
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.
"%yt-dlp%" --update-to master
echo.&echo [92m [END] &>nul timeout /t 5&exit

