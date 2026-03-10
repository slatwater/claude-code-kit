@echo off
chcp 65001 >nul 2>nul
title Claude Code
echo.
echo 正在启动 Claude Code...
echo （使用 Kimi Code 模型，国内直连）
echo.

:: 读取环境变量
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_BASE_URL','User')"') do set ANTHROPIC_BASE_URL=%%i
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "[System.Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY','User')"') do set ANTHROPIC_API_KEY=%%i

if "%ANTHROPIC_API_KEY%"=="" (
    echo [错误] 未找到 API Key。
    echo 请先运行「2-设置密钥.bat」配置密钥。
    echo.
    echo 按任意键退出...
    pause >nul
    exit
)

:: 检查 claude 命令
where claude >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未找到 claude 命令。
    echo 请先运行「1-安装.bat」安装 Claude Code。
    echo.
    echo 按任意键退出...
    pause >nul
    exit
)

:: 启动
claude
