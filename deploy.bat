# 🚀 一键部署脚本 - Japan Trip 2026

@echo off
chcp 65001 > nul
cls
echo.
echo ========================================
echo   Japan Trip 2026 - GitHub Pages 部署
echo ========================================
echo.

REM 检查 Git 是否安装
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 错误：未检测到 Git
    echo.
    echo 请先安装 Git：
    echo 1. 访问：https://git-scm.com/download/win
    echo 2. 下载并安装 Git for Windows
    echo 3. 安装完成后重新运行此脚本
    echo.
    pause
    exit /b 1
)

echo ✅ 检测到 Git
echo.

REM 进入项目目录
cd /d "c:\Users\70927\WorkBuddy\20260407093217"

REM 检查是否已初始化
if not exist ".git" (
    echo 📝 正在初始化 Git 仓库...
    git init
    git config user.name "chenniyang666"
    git config user.email "chenniyang666@gmail.com"
    echo ✅ Git 仓库已初始化
    echo.
) else (
    echo ✅ Git 仓库已存在
    echo.
)

REM 添加所有文件
echo 📦 正在添加文件...
git add .

REM 提交更改
echo 💾 正在提交更改...
git commit -m "Initial commit: 日本行程页面"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ⚠️  提示：没有新的更改需要提交
) else (
    echo ✅ 提交成功
)
echo.

REM 检查远程仓库
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 🔗 正在添加远程仓库...
    git remote add origin https://github.com/chenniyang666/japan-trip-2026.git
    git branch -M main
    echo ✅ 远程仓库已添加
) else (
    echo ✅ 远程仓库已配置
)
echo.

echo.
echo ========================================
echo   准备推送到 GitHub
echo ========================================
echo.
echo 仓库地址：https://github.com/chenniyang666/japan-trip-2026
echo.
echo ⚠️  注意：首次推送需要认证
echo.
echo 请选择推送方式：
echo.
echo   1. 使用 PAT Token（推荐）
echo   2. 使用 GitHub CLI (gh)
echo   3. 手动推送
echo.
set /p choice="请输入选项 (1/2/3): "

if "%choice%"=="1" goto push_with_token
if "%choice%"=="2" goto push_with_gh
if "%choice%"=="3" goto manual_push

:push_with_token
echo.
echo ========================================
echo   使用 PAT Token 推送
echo ========================================
echo.
echo 请按以下步骤获取 PAT Token：
echo.
echo 1. 访问：https://github.com/settings/tokens
echo 2. 点击 "Generate new token" → "Generate new token (classic)"
echo 3. 填写信息：
echo    - Note: Git Push Token
echo    - Expiration: 90 days
echo    - Select scopes: 勾选 repo（全选）
echo 4. 点击 Generate token
echo 5. 复制显示的 Token（只显示一次）
echo.
echo ----------------------------------------
echo.
echo 正在推送到 GitHub...
echo.
git push -u origin main
goto end

:push_with_gh
echo.
echo ========================================
echo   使用 GitHub CLI 推送
echo ========================================
echo.
where gh >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 错误：未检测到 GitHub CLI
    echo.
    echo 请先安装 GitHub CLI：
    echo 1. 访问：https://cli.github.com/
    echo 2. 下载并安装
    echo 3. 运行：gh auth login
    echo.
    pause
    exit /b 1
)

echo ✅ 检测到 GitHub CLI
echo.
echo 正在检查登录状态...
gh auth status >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  未登录，请先登录：
    echo.
    echo 运行：gh auth login
    echo.
    pause
    exit /b 1
)

echo ✅ 已登录
echo.
echo 正在推送到 GitHub...
git push -u origin main
goto end

:manual_push
echo.
echo ========================================
echo   手动推送
echo ========================================
echo.
echo 请在 PowerShell 中运行以下命令：
echo.
echo cd c:\Users\70927\WorkBuddy\20260407093217
echo git push -u origin main
echo.
echo 提示：
echo - Username: chenniyang666
echo - Password: 输入您的 PAT Token（不是密码）
echo.
pause
exit /b 0

:end
echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================
    echo   ✅ 部署成功！
    echo ========================================
    echo.
    echo 下一步：
    echo.
    echo 1. 访问仓库：https://github.com/chenniyang666/japan-trip-2026
    echo 2. 点击 Settings → Pages
    echo 3. 启用 GitHub Pages：
    echo    - Source: Deploy from a branch
    echo    - Branch: main
    echo    - Directory: / (root)
    echo 4. 点击 Save
    echo.
    echo 等待 1-2 分钟后，访问您的网站：
    echo.
    echo 🌐 https://chenniyang666.github.io/japan-trip-2026/
    echo.
) else (
    echo ========================================
    echo   ❌ 部署失败
    echo ========================================
    echo.
    echo 请检查：
    echo 1. PAT Token 是否正确
    echo 2. 仓库是否已创建
    echo 3. 网络连接是否正常
    echo.
)
echo.
pause
