# GitHub Pages 部署指南

## 📝 前置准备

### 1. 注册 GitHub 账号
访问：https://github.com/signup

**注册步骤：**
1. 输入您的邮箱地址
2. 设置密码（建议使用强密码）
3. 设置用户名（建议：您的英文名或昵称 + 数字）
4. 选择是否接收更新邮件（可选）
5. 完成人机验证（选图验证）
6. 打开邮箱，点击验证链接
7. 登录 GitHub，进入邮箱再次确认

**建议的用户名：**
- 您的真实姓名拼音，例如：zhangsan
- 加上数字区分，例如：zhangsan123

### 2. 安装 Git

#### Windows 用户
1. 访问：https://git-scm.com/download/win
2. 下载 Git for Windows 安装包
3. 运行安装程序，使用默认选项一路点击 Next
4. 安装完成后，打开 PowerShell 或 CMD，输入 `git --version` 检查是否安装成功

#### 验证安装
```powershell
git --version
# 应该输出类似：git version 2.45.0.windows.1
```

---

## 🚀 部署步骤

### 步骤 1：配置 Git 用户信息

打开 PowerShell 或 CMD，执行：

```powershell
git config --global user.name "您的GitHub用户名"
git config --global user.email "您的注册邮箱"
```

### 步骤 2：创建 GitHub 仓库

1. 登录 GitHub：https://github.com
2. 点击右上角 `+` 号，选择 `New repository`
3. 填写仓库信息：
   - **Repository name**: `japan-trip-2026`
   - **Description**: 日本2026年行程计划
   - 选择 `Public`（公开）或 `Private`（私有）
   - **不要**勾选 "Add a README file"
   - **不要**勾选 "Add .gitignore"
   - **不要**勾选 "Choose a license"
4. 点击 `Create repository`

### 步骤 3：初始化本地 Git 仓库

```powershell
# 进入项目目录
cd c:\Users\70927\WorkBuddy\20260407093217

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交更改
git commit -m "Initial commit: 日本行程页面"
```

### 步骤 4：推送到 GitHub

在 GitHub 创建仓库后，页面会显示推送命令，执行：

```powershell
# 添加远程仓库（替换 YOUR_USERNAME 为您的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/japan-trip-2026.git

# 推送到主分支
git branch -M main
git push -u origin main
```

**首次推送需要身份验证：**
- GitHub 现在推荐使用 **Personal Access Token (PAT)** 而非密码
- 密码位置输入您的 PAT（获取方式见下方）

### 步骤 5：启用 GitHub Pages

1. 打开您的仓库：`https://github.com/YOUR_USERNAME/japan-trip-2026`
2. 点击 `Settings` 标签
3. 在左侧菜单中找到 `Pages`
4. 在 `Build and deployment` 部分：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main`，目录选择 `/ (root)`
   - 点击 `Save`

5. 等待 1-2 分钟，页面刷新后会显示：
   ```
   🎉 Your site is live at https://YOUR_USERNAME.github.io/japan-trip-2026/
   ```

---

## 🔑 获取 GitHub Personal Access Token (PAT)

### 为什么需要 PAT？
GitHub 已不再支持使用密码推送代码，需要使用 Personal Access Token。

### 创建 PAT 步骤：

1. 登录 GitHub
2. 点击右上角头像 → `Settings`
3. 在左侧菜单底部找到 `Developer settings`
4. 点击 `Personal access tokens` → `Tokens (classic)`
5. 点击 `Generate new token` → `Generate new token (classic)`

6. 填写 Token 信息：
   - **Note**: 例如 `Git Push for Windows`
   - **Expiration**: 选择有效期（建议 90 days）
   - **Select scopes**: 勾选 `repo`（这将包含所有仓库权限）

7. 点击 `Generate token`
8. **重要：复制显示的 Token 并保存**（只显示一次，刷新页面就看不到了）

### 使用 Token 推送代码

在 Git 推送时：
- **Username**: 输入您的 GitHub 用户名
- **Password**: 输入刚才复制的 PAT（而不是您的 GitHub 密码）

---

## 🌐 访问您的网站

部署成功后，您的网站可以通过以下地址访问：

```
https://YOUR_USERNAME.github.io/japan-trip-2026/
```

- `index.html` → `https://YOUR_USERNAME.github.io/japan-trip-2026/`
- `itinerary.html` → `https://YOUR_USERNAME.github.io/japan-trip-2026/itinerary.html`

---

## 📝 更新文件流程

如果您修改了 HTML 文件，重新部署的步骤：

```powershell
cd c:\Users\70927\WorkBuddy\20260407093217

# 查看更改
git status

# 添加修改的文件
git add .

# 提交更改
git commit -m "更新：添加新内容"

# 推送到 GitHub
git push
```

---

## 🔧 常见问题

### 问题 1：推送时提示认证失败
- 确认使用的是 PAT 而非密码
- 检查 PAT 是否过期
- 确认 PAT 是否有 `repo` 权限

### 问题 2：GitHub Pages 显示 404
- 检查 Pages 设置中 Branch 是否正确选择
- 等待 2-3 分钟，有时部署需要时间
- 查看仓库的 Actions 标签，看是否有构建错误

### 问题 3：网页样式不对
- 确认 HTML 文件中的 `<style>` 标签内容完整
- 检查浏览器控制台是否有错误（F12 打开）

### 问题 4：如何删除仓库
- 仓库 → Settings → 滚动到底部 → Delete this repository

---

## 📱 移动端访问

您的网站是响应式的，可以在手机浏览器中正常访问。

---

## 🎯 下一步

完成以上步骤后：
1. ✅ 访问您的网站确认显示正常
2. ✅ 将网站链接分享给家人
3. ✅ 需要更新时，按照"更新文件流程"操作

---

## 💡 提示

- GitHub Pages 是完全免费的
- 公开仓库的网站可以被任何人访问
- 如果需要隐私，可以使用私有仓库 + GitHub Team
- 建议定期备份您的 HTML 文件

---

如有问题，请参考：https://docs.github.com/en/pages
