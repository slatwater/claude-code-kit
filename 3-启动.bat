@echo off
chcp 65001 >nul
title Claude Code
echo.
echo 正在启动 Claude Code...
echo （使用 Kimi Code 模型，国内直连）
echo.

:: 读取环境变量
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_BASE_URL','User')"') do set ANTHROPIC_BASE_URL=%%i
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','User')"') do set ANTHROPIC_API_KEY=%%i

if "%ANTHROPIC_API_KEY%"=="" (
    echo ❌ 未找到 API Key，请先运行「2-设置密钥.bat」
    pause
    exit
)

:: 启动 Claude Code
claude
