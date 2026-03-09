@echo off
chcp 65001 >nul
title Claude Code 安装程序
echo.
echo ========================================
echo   Claude Code 一键安装（国内版）
echo ========================================
echo.
echo [1/3] 安装 Git...
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
echo.
echo [2/3] 安装 Node.js...
winget install OpenJS.NodeJS --accept-package-agreements --accept-source-agreements
echo.
echo ⚠️  请关闭此窗口，重新打开后双击「1-安装.bat」再次运行
echo     （首次安装 Node.js 后需要重启终端才能生效）
echo.
echo 如果已经重启过终端，按任意键继续安装 Claude Code...
pause >nul
echo.
echo [3/3] 安装 Claude Code（使用国内镜像）...
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force"
call npm install -g @anthropic-ai/claude-code --registry=https://registry.npmmirror.com
echo.
echo 初始化配置...
node --eval "const os=require('os'),fs=require('fs'),path=require('path');const f=path.join(os.homedir(),'.claude.json');let c={};try{if(fs.existsSync(f))c=JSON.parse(fs.readFileSync(f,'utf-8'));}catch(e){}c.hasCompletedOnboarding=true;fs.writeFileSync(f,JSON.stringify(c,null,2),'utf-8');console.log('配置写入成功: '+f);"
echo.
echo ✅ 安装完成！请双击「2-设置密钥.bat」配置 API Key
echo.
pause
