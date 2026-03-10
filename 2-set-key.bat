@echo off
title Set Kimi API Key
echo.
echo ========================================
echo   Configure Kimi API Key
echo ========================================
echo.
echo Get your API Key from: https://kimi.com
echo Format: sk-kimi-xxxxxxxx...
echo.
set /p APIKEY="Paste your API Key here: "

if "%APIKEY%"=="" (
    echo.
    echo [ERROR] No API Key entered. Please re-run this script.
    echo.
    goto :end
)

:: Save to user environment variables (persistent)
powershell -Command "[System.Environment]::SetEnvironmentVariable('ANTHROPIC_BASE_URL','https://api.kimi.com/coding/',[System.EnvironmentVariableTarget]::User)"
powershell -Command "[System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY','%APIKEY%',[System.EnvironmentVariableTarget]::User)"

echo.
echo ========================================
echo   API Key saved!
echo   Now double-click 3-start.bat
echo ========================================
echo.

:end
echo Press any key to exit...
pause >nul
