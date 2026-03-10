@echo off
title Claude Code
echo.
echo Starting Claude Code...
echo (Using Kimi API - direct connection)
echo.

:: Load environment variables
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_BASE_URL','User')"') do set ANTHROPIC_BASE_URL=%%i
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','User')"') do set ANTHROPIC_API_KEY=%%i

if "%ANTHROPIC_API_KEY%"=="" (
    echo [ERROR] API Key not found.
    echo Please run 2-set-key.bat first.
    echo.
    echo Press any key to exit...
    pause >nul
    exit
)

:: Check claude command
where claude >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] claude command not found.
    echo Please run 1-install.bat first.
    echo.
    echo Press any key to exit...
    pause >nul
    exit
)

:: Launch
claude
