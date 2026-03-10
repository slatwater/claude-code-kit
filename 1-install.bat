@echo off
title Claude Code Installer
echo.
echo ========================================
echo   Claude Code - One Click Install
echo ========================================
echo.

:: Check winget
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] winget not found.
    echo.
    echo Please open Microsoft Store, search "App Installer" and install/update it.
    echo Then re-run this script.
    echo.
    goto :end
)

:: Check if Node.js already installed
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [SKIP] Node.js already installed:
    node --version
    echo.
    goto :install_claude
)

echo [1/3] Installing Git...
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
echo.

echo [2/3] Installing Node.js...
winget install OpenJS.NodeJS --accept-package-agreements --accept-source-agreements
echo.

:: Verify node is available after install
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ========================================
    echo   Node.js installed. Please CLOSE this
    echo   window and double-click 1-install.bat
    echo   again to continue.
    echo ========================================
    echo.
    goto :end
)

:install_claude
echo [3/3] Installing Claude Code (China mirror)...
echo.
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force" >nul 2>nul
call npm install -g @anthropic-ai/claude-code --registry=https://registry.npmmirror.com
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Claude Code install failed. Check your network and retry.
    goto :end
)
echo.

echo Initializing config...
node --eval "const os=require('os'),fs=require('fs'),path=require('path');const f=path.join(os.homedir(),'.claude.json');let c={};try{if(fs.existsSync(f))c=JSON.parse(fs.readFileSync(f,'utf-8'));}catch(e){}c.hasCompletedOnboarding=true;fs.writeFileSync(f,JSON.stringify(c,null,2),'utf-8');console.log('OK: '+f);"
echo.
echo ========================================
echo   DONE! Now double-click 2-set-key.bat
echo ========================================
echo.

:end
echo Press any key to exit...
pause >nul
