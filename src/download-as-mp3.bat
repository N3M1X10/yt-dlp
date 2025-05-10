@echo off
chcp 65001>nul
setlocal

:: params
cd /d "%~dp0"
set format=mp3
set ffmpeg=%~dp0bin\ffmpeg.exe
set yt-dlp=%~dp0bin\yt-dlp.exe

set title=[ yt-dlp : download as %format% ]
title %title% &echo %title% &echo.

:begin
set /p url=[92mEnter video URL: [0m
echo.& echo [96m [Welcome to yt-dlp] [0m &echo.

:: yt-dlp command
"%yt-dlp%" --ffmpeg-location "%ffmpeg%" ^
--extract-audio --audio-format %format% ^
-P downloaded\%format%\ "%url%"
IF %ERRORLEVEL% NEQ 0 (echo.&echo ! Some error on the way &pause>nul&exit)

:end
echo.&echo [92m [END] &endlocal&>nul timeout /t 3&exit
rem echo.&echo [92m [END]:pause &endlocal&pause>nul&exit
