@echo off
setlocal


set title=[ yt-dlp : update ]
set yt-dlp=%~dp0bin\yt-dlp.exe
set debug=

title %title% &echo %title% &echo.


:update
cd /d "%~dp0"
if not exist "%yt-dlp%" (
    echo ERROR : "%yt-dlp%" has not found
    pause
    goto:close
)
"%yt-dlp%" --update-to master


:end
if "%debug%"=="1" (
    echo.&echo [93m[END] : pause . . . &pause>nul
    goto:close
) else (
    echo.&echo [92m[END] : the window will close automatically
    >nul timeout /t 2
    goto:close
)


:close
cls
endlocal
exit

