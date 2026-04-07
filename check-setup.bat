# 🔍 诊断脚本 - 检查部署环境

@echo off
chcp 65001 > nul
cls
echo.
echo ========================================
echo   部署环境诊断
echo ========================================
echo.

REM 1. 检查 Git
echo [1/5] 检查 Git 安装...
where git >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ Git 已安装
    for /f "tokens=*" %%i in ('git --version') do set GIT_VERSION=%%i
    echo    版本：%GIT_VERSION%
) else (
    echo ❌ Git 未安装
    echo    请访问 https://git-scm.com/download/win 安装
)
echo.

REM 2. 检查 Git 配置
echo [2/5] 检查 Git 配置...
if exist ".git" (
    echo ✅ Git 仓库已初始化
    for /f "tokens=*" %%i in ('git config user.name 2^>nul') do set GIT_NAME=%%i
    for /f "tokens=*" %%i in ('git config user.email 2^>nul') do set GIT_EMAIL=%%i
    if defined GIT_NAME (
        echo    用户名：%GIT_NAME%
    ) else (
        echo    ⚠️  未配置用户名
    )
    if defined GIT_EMAIL (
        echo    邮箱：%GIT_EMAIL%
    ) else (
        echo    ⚠️  未配置邮箱
    )
) else (
    echo ⚠️  Git 仓库未初始化
)
echo.

REM 3. 检查文件
echo [3/5] 检查文件...
if exist "index.html" (
    echo ✅ index.html 存在
) else (
    echo ❌ index.html 不存在
)

if exist "itinerary.html" (
    echo ✅ itinerary.html 存在
) else (
    echo ❌ itinerary.html 不存在
)
echo.

REM 4. 检查远程仓库
echo [4/5] 检查远程仓库配置...
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ 已配置远程仓库
    for /f "tokens=*" %%i in ('git remote get-url origin') do set REMOTE_URL=%%i
    echo    URL：%REMOTE_URL%
    echo.
    echo    验证仓库是否存在...
    curl -s -o nul -w "%%{http_code}" https://github.com/chenniyang666/japan-trip-2026 >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo    ✅ 仓库已创建
    ) else (
        echo    ❌ 仓库未创建或无法访问
        echo    请访问：https://github.com/new 创建仓库
    )
) else (
    echo ⚠️  未配置远程仓库
)
echo.

REM 5. 检查网络连接
echo [5/5] 检查网络连接...
ping -n 1 github.com >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ 可以连接 GitHub
) else (
    echo ❌ 无法连接 GitHub
    echo    请检查网络连接
)
echo.

echo ========================================
echo   诊断完成
echo ========================================
echo.
echo 如果以上检查全部通过，但仍推送失败，
echo 请尝试以下操作：
echo.
echo 1. 确认已在 GitHub 创建仓库：
echo    https://github.com/new
echo    仓库名：japan-trip-2026
echo.
echo 2. 确认 PAT Token 正确：
echo    https://github.com/settings/tokens
echo    必须勾选 repo 权限
echo.
echo 3. 重新运行部署脚本：
echo    deploy-v2.bat
echo.
pause
