# 自动部署脚本 - Japan Trip 2026
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Japan Trip 2026 - GitHub Pages 部署" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 刷新环境变量
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 进入项目目录
Set-Location "c:\Users\70927\WorkBuddy\20260407093217"

# 配置 Git
Write-Host "正在配置 Git..." -ForegroundColor Yellow
git config --global user.name "chenniyang666"
git config --global user.email "chenniyang666@gmail.com"
Write-Host "✅ Git 配置完成" -ForegroundColor Green
Write-Host ""

# 初始化仓库
if (Test-Path ".git") {
    Write-Host "✅ Git 仓库已存在" -ForegroundColor Green
} else {
    Write-Host "正在初始化 Git 仓库..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git 仓库已初始化" -ForegroundColor Green
}
Write-Host ""

# 添加文件
Write-Host "正在添加文件..." -ForegroundColor Yellow
git add .
Write-Host "✅ 文件已添加" -ForegroundColor Green
Write-Host ""

# 提交更改
Write-Host "正在提交更改..." -ForegroundColor Yellow
git commit -m "Initial commit: 日本行程页面"
Write-Host "✅ 提交成功" -ForegroundColor Green
Write-Host ""

# 添加远程仓库
Write-Host "正在添加远程仓库..." -ForegroundColor Yellow
git remote add origin https://github.com/chenniyang666/japan-trip-2026.git
git branch -M main
Write-Host "✅ 远程仓库已添加" -ForegroundColor Green
Write-Host ""

# 推送到 GitHub
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  正在推送到 GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "仓库地址: https://github.com/chenniyang666/japan-trip-2026" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  首次推送需要认证" -ForegroundColor Yellow
Write-Host "Username: chenniyang666" -ForegroundColor White
Write-Host "Password: 输入您的 GitHub PAT Token (不是密码)" -ForegroundColor White
Write-Host ""
Write-Host "获取 PAT Token: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""
Write-Host "按回车键继续..." -ForegroundColor Yellow
Read-Host

Write-Host ""
git push -u origin main

Write-Host ""
if ($LASTEXITCODE -eq 0) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✅ 部署成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "下一步：启用 GitHub Pages" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. 访问: https://github.com/chenniyang666/japan-trip-2026" -ForegroundColor White
    Write-Host "2. 点击 Settings → Pages" -ForegroundColor White
    Write-Host "3. 启用 GitHub Pages:" -ForegroundColor White
    Write-Host "   - Source: Deploy from a branch" -ForegroundColor White
    Write-Host "   - Branch: main" -ForegroundColor White
    Write-Host "   - Directory: / (root)" -ForegroundColor White
    Write-Host "4. 点击 Save" -ForegroundColor White
    Write-Host ""
    Write-Host "等待 1-2 分钟后，访问您的网站:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "🌐 https://chenniyang666.github.io/japan-trip-2026/" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ❌ 部署失败" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "请检查:" -ForegroundColor Yellow
    Write-Host "1. PAT Token 是否正确" -ForegroundColor White
    Write-Host "2. 仓库是否已创建" -ForegroundColor White
    Write-Host "3. 网络连接是否正常" -ForegroundColor White
    Write-Host ""
}

Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
