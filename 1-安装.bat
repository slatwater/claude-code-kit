@echo off
chcp 65001 >nul 2>nul
title Claude Code 安装程序
echo.
echo ========================================
echo   Claude Code 一键安装（国内版）
echo ========================================
echo.

:: 检查 winget
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未找到 winget 命令。
    echo.
    echo 请打开 Microsoft Store，搜索「应用安装程序」并安装/更新。
    echo 安装完成后重新运行此脚本。
    echo.
    goto :end
)

:: 检查 Node.js
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [跳过] Node.js 已安装，版本：
    node --version
    echo.
    goto :install_claude
)

echo [1/3] 安装 Git...
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
echo.

echo [2/3] 安装 Node.js...
winget install OpenJS.NodeJS --accept-package-agreements --accept-source-agreements
echo.

:: 验证 node 是否可用
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ========================================
    echo   Node.js 已安装，但需要重启终端才能生效
    echo ========================================
    echo.
    echo 请关闭此窗口，重新双击「1-安装.bat」继续。
    echo.
    goto :end
)

:install_claude
echo [3/3] 安装 Claude Code（使用国内镜像）...
echo.
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force" >nul 2>nul
call npm install -g @anthropic-ai/claude-code --registry=https://registry.npmmirror.com
if %errorlevel% neq 0 (
    echo.
    echo [错误] Claude Code 安装失败，请检查网络后重试。
    goto :end
)
echo.

echo 初始化配置...
node --eval "const os=require('os'),fs=require('fs'),path=require('path');const f=path.join(os.homedir(),'.claude.json');let c={};try{if(fs.existsSync(f))c=JSON.parse(fs.readFileSync(f,'utf-8'));}catch(e){}c.hasCompletedOnboarding=true;fs.writeFileSync(f,JSON.stringify(c,null,2),'utf-8');console.log('OK: '+f);"
echo.
echo ========================================
echo   安装完成！
echo   请双击「2-设置密钥.bat」配置 API Key
echo ========================================
echo.

:end
echo 按任意键退出...
pause >nul
