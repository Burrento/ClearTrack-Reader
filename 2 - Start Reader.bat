@echo off
title ClearTrack Reader - keep this window open
cd /d "%~dp0"

rem The site address must match the browser's address bar exactly (the bridge only talks to this site)
set SITE=https://lgc-cleartrack.duckdns.org

python -c "import smartcard" >nul 2>nul
if errorlevel 1 (
    echo The card reader library is missing. Run "1 - Install Prerequisites.bat" first.
    pause
    exit /b 1
)

rem Auto-update: fetch the newest reader program from GitHub (main branch). Offline or a broken
rem download keeps the current copy, which is only replaced once the new file parses as Python.
echo Checking for reader updates...
set UPDATED=
curl -fsSL --max-time 15 -o reader\bridge.new https://raw.githubusercontent.com/Burrento/ClearTrack/main/tools/acr122u_bridge.py >nul 2>nul && python -c "import ast,sys; ast.parse(open(sys.argv[1], encoding='utf-8').read())" reader\bridge.new >nul 2>nul && move /y reader\bridge.new reader\acr122u_bridge.py >nul && set UPDATED=1
if exist reader\bridge.new del reader\bridge.new
if defined UPDATED (echo Reader program is up to date.) else (echo Could not check for updates. Using the copy already on this laptop.)
echo.

echo Opening ClearTrack in your browser...
start "" %SITE%
echo.
echo Keep this window open while scanning. Close it, or press Ctrl+C, to stop the reader.
echo.
python reader\acr122u_bridge.py %SITE%

echo.
echo The reader stopped. If you see "address already in use" above, the reader is already running in another window.
pause
