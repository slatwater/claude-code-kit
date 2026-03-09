# Claude Code 一键安装包（Windows 国内版）

> 🇨🇳 专为中国用户打造 —— 无需翻墙，双击即用

在 Windows 上三步安装 [Claude Code](https://docs.anthropic.com/en/docs/claude-code)，通过 [Kimi](https://kimi.com) API 国内直连使用。

## ✨ 特性

- **零门槛** —— 双击 `.bat` 脚本，无需命令行经验
- **国内直连** —— 使用 Kimi API，不需要代理/VPN
- **npm 国内镜像** —— 安装走 npmmirror，速度拉满
- **一键更新** —— 重新运行安装脚本即可升级

## 📋 前提条件

- Windows 10 (1809+) 或 Windows 11
- 能正常上网（**不需要翻墙**）
- 一个 Kimi API Key（[会员页面](https://kimi.com) 获取）

## 🚀 快速开始

### 第一步：安装

双击 **`1-安装.bat`**

自动安装 Git、Node.js 和 Claude Code。首次安装 Node.js 后需要**关闭窗口再重新打开**运行一次。

### 第二步：配置密钥

双击 **`2-设置密钥.bat`**

粘贴你的 Kimi API Key（格式：`sk-kimi-xxxxxxxx...`）。

### 第三步：启动

双击 **`3-启动.bat`**

Claude Code 启动，直接用中文对话！

## 💬 使用示例

```
> 帮我写一个 Python 计算器
> 读一下当前目录的代码，告诉我是做什么的
> 帮我修复这个 bug
```

退出：输入 `/exit` 或按 `Ctrl+C`

## 📁 文件说明

| 文件 | 用途 |
|------|------|
| `1-安装.bat` | 安装 Git + Node.js + Claude Code（使用 npmmirror） |
| `2-设置密钥.bat` | 配置 Kimi API Key（写入用户环境变量） |
| `3-启动.bat` | 启动 Claude Code（自动读取已保存的 Key） |
| `使用说明.txt` | 离线使用说明，双击可看 |

## ❓ 常见问题

| 问题 | 解决方案 |
|------|----------|
| 提示 "npm 不是内部命令" | 关闭终端重新打开；不行就重启电脑后再运行 `1-安装.bat` |
| 安装很慢 | 已使用国内镜像，耐心等待 |
| 更换 API Key | 重新运行 `2-设置密钥.bat` |
| 更新 Claude Code | 重新运行 `1-安装.bat` |
| winget 找不到 | 打开 Microsoft Store → 搜索「应用安装程序」→ 更新 |

## 🔧 技术细节

- Claude Code 通过 `npm -g` 全局安装，源：`registry.npmmirror.com`
- API 端点：`https://api.kimi.com/coding/`（通过 `ANTHROPIC_BASE_URL` 环境变量配置）
- API Key 存储在 Windows 用户级环境变量中，永久生效
- 自动跳过 Claude Code onboarding 流程（写入 `~/.claude.json`）

## 📄 License

MIT
