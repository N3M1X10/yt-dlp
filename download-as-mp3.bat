@echo off
chcp 65001>nul

set format=mp3
set ffmpeg=%~dp0bin\ffmpeg\bin\ffmpeg.exe
set yt-dlp=%~dp0bin\yt-dlp\yt-dlp.exe

set title=[ yt-dlp : download as %format% ]
title %title% &echo %title% &echo.

:begin
set /p url=[92mEnter URL: [0m
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.
"%yt-dlp%" --ffmpeg-location "%ffmpeg%" --extract-audio --audio-format %format% %url%
rem IF ERRORLEVEL==0 (start "%~dp0" "%~dp0")

:end
echo.&echo [92m [END] &>nul timeout /t 3&exit
