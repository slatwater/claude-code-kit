@echo off
chcp 65001 >nul
title 配置 Kimi API Key
echo.
echo ========================================
echo   配置 Kimi API Key
echo ========================================
echo.
echo 请前往 https://kimi.com 会员页面获取 API Key
echo API Key 格式：sk-kimi-xxxxxxxx...
echo.
set /p APIKEY="请粘贴你的 API Key: "
echo.

:: 写入用户环境变量（永久生效）
powershell -Command "[System.Environment]::SetEnvironmentVariable('ANTHROPIC_BASE_URL','https://api.kimi.com/coding/',[System.EnvironmentVariableTarget]::User)"
powershell -Command "[System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY',\"%APIKEY%\",[System.EnvironmentVariableTarget]::User)"

echo ✅ API Key 已保存！
echo.
echo 现在可以双击「3-启动.bat」开始使用了
echo.
pause
