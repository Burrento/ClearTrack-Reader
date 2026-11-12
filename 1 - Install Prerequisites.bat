@echo off
title ClearTrack Reader - Install prerequisites
cd /d "%~dp0"

echo Checking Python...
rem "python -c" fails for the Microsoft Store placeholder too, unlike "where python"
python -c "import sys" >nul 2>nul
if errorlevel 1 (
    echo.
    echo Python is not installed.
    echo 1. The Python download page will open now.
    echo 2. Run the installer and TICK "Add python.exe to PATH" on the first screen.
    echo 3. Close this window and run "1 - Install Prerequisites.bat" again.
    start "" https://www.python.org/downloads/
    pause
    exit /b 1
)
python --version

echo.
echo Installing the card reader library (pyscard)...
python -m pip install --upgrade -r reader\requirements.txt
if errorlevel 1 (
    echo.
    echo Installing pyscard failed. Check the internet connection and try again.
    pause
    exit /b 1
)

echo.
echo Done. Plug in the ACR122U reader, then run "2 - Start Reader.bat".
echo If the reader is not detected, install the driver in "Prerequisites\ACS Reader Driver\Setup.exe".
pause
