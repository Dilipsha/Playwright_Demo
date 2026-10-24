@echo off
setlocal

rem Always run from the folder containing this script.
cd /d "%~dp0"

echo Checking Node.js and npm...
where node >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or is not on PATH.
    echo Install Node.js from https://nodejs.org/ and run this file again.
    exit /b 1
)

where npm >nul 2>&1
if errorlevel 1 (
    echo ERROR: npm is not installed or is not on PATH.
    echo Install Node.js from https://nodejs.org/ and run this file again.
    exit /b 1
)

node --version
call npm --version

echo.
echo Installing project dependencies...
call npm install
if errorlevel 1 (
    echo ERROR: npm install failed.
    exit /b 1
)

echo.
echo Installing Playwright browsers...
call npx playwright install
if errorlevel 1 (
    echo ERROR: Playwright browser installation failed.
    exit /b 1
)

echo.
echo Playwright environment setup completed successfully.
endlocal
exit /b 0
