@echo off
chcp 65001>nul
setlocal


:Params
:: possible: 'best', 'aac', 'alac', 'flac', 'm4a', 'mp3', 'opus', 'vorbis', 'wav'.
set format=m4a

set ffmpeg=%~dp0bin\ffmpeg.exe
set yt-dlp=%~dp0bin\yt-dlp.exe

:: delay on the end of a file
set timeout=3
:: debug mode
set debug=0

:: accepting arguments
if "%~1" neq "" (set url=%~1)
if "%~2" neq "" (set format=%~2)

:End-Of-Params


::hello
if "%format%"=="best" (
	set title=[ yt-dlp ^: download as original format ^(best^) ]
) else (
	set title=[ yt-dlp ^: download as '*.%format%' ]
)
title %title%
echo.&echo %title%


:checks

if not exist "%yt-dlp%" (
	:: yt-dlp has not found
    echo.&echo [91m[ERROR] ^: yt-dlp has not found in: "%yt-dlp%"
    echo [93m[note] ^: Please, make sure that you placed the yt-dlp into the correct directory.[0m
    echo [93m[note] ^: You can download yt-dlp from^: [97mhttps://github.com/yt-dlp/yt-dlp/releases[0m
    echo.
    echo The script will be interrupted
    pause
    goto:close
) else (
	::format
	if "%format%"=="best" (
		rem dn
	) else if "%format%"=="aac" (
		rem dn
	) else if "%format%"=="alac" (
		rem dn
	) else if "%format%"=="flac" (
		rem dn
	) else if "%format%"=="m4a" (
		rem dn
	) else if "%format%"=="mp3" (
		rem dn
	) else if "%format%"=="opus" (
		rem dn
	) else if "%format%"=="vorbis" (
		rem dn
	) else if "%format%"=="wav" (
		rem dn
	) else (
		echo.&echo [91m[ERROR] ^: incorrect format[0m
		echo The script will be interrupted
		pause
		goto:close
	)
)


:ask
if "%url%"=="" (
	echo.&set /p url=[92mEnter the URL: [0m

	:yt-dlp-update
	echo.&echo Checking for update . . .
	"%yt-dlp%" --update-to master
	if %errorlevel% neq 0 (pause)

	goto :download
)



:download
cd /d "%~dp0"
echo.&echo [yt-dlp] ^: Trying to download from "%url%" . . .
if "%format%"=="best" (
	:: if empty - original (best quality)
	"%yt-dlp%" -P downloaded\original\ "%url%"
) else (
	:: if format is selected by user
	"%yt-dlp%" --ffmpeg-location "%ffmpeg%" ^
	--extract-audio --audio-format %format% ^
	-P downloaded\%format%\ "%url%"
)
goto :end


:end
if "%debug%"=="1" (
    echo.&echo [93m[END] ^: pause . . . &pause>nul
    goto:close
) else (
    echo.&echo [92m[END] ^: the window will close automatically
    >nul timeout /t %timeout%
    goto:close
)


:close
cls
endlocal
exit

