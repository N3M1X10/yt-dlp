@echo off
chcp 65001>nul

set format=mp4
set yt-dlp=%~dp0bin\yt-dlp\yt-dlp.exe

set title=[ yt-dlp : download as %format% ]
title %title% &echo %title% &echo.

:begin
set /p url=[92mEnter URL: [0m
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.
"%yt-dlp%" %url%
rem IF ERRORLEVEL==0 (start "%~dp0" "%~dp0")

:end
echo.&echo [92m [END] &>nul timeout /t 3&exit