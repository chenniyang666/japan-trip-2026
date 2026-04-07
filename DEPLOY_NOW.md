# 🚀 快速部署脚本 - Japan Trip 2026

## 前置条件
✅ GitHub 账号：chenniyang666@gmail.com
✅ 已创建仓库：https://github.com/chenniyang666/japan-trip-2026

---

## 步骤 1：安装 Git（如未安装）

1. 访问：https://git-scm.com/download/win
2. 下载 Git for Windows 安装包
3. 运行安装程序，使用默认选项一路点击 Next
4. 安装完成后，关闭所有 PowerShell/CMD 窗口，重新打开

**验证安装：**
```powershell
git --version
```

---

## 步骤 2：配置 Git（首次使用）

打开 PowerShell，执行以下命令：

```powershell
git config --global user.name "chenniyang666"
git config --global user.email "chenniyang666@gmail.com"
```

---

## 步骤 3：初始化并提交代码

```powershell
# 进入项目目录
cd c:\Users\70927\WorkBuddy\20260407093217

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交更改
git commit -m "Initial commit: 日本行程页面"

# 添加远程仓库
git remote add origin https://github.com/chenniyang666/japan-trip-2026.git

# 设置主分支
git branch -M main
```

---

## 步骤 4：推送到 GitHub

### 方式 A：使用 Personal Access Token (PAT) - 推荐

**4.1 获取 PAT：**
1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 填写信息：
   - Note: `Git Push Token`
   - Expiration: `90 days` 或 `No expiration`
   - Select scopes: 勾选 `repo`（展开后全选）
4. 点击 "Generate token"
5. **复制显示的 Token**（只显示一次，务必保存）

**4.2 推送代码：**
```powershell
git push -u origin main
```

提示输入时：
- **Username**: `chenniyang666`
- **Password**: 粘贴刚才复制的 PAT Token（不是邮箱密码）

---

### 方式 B：使用 GitHub CLI (gh) - 最简单

如果已安装 GitHub CLI：

```powershell
# 登录 GitHub
gh auth login

# 选择选项：
# 1. GitHub.com
# 2. HTTPS
# 3. Login with a web browser（推荐）或 Paste an authentication token
# 4. Login with a device code

# 登录成功后，推送代码
git push -u origin main
```

---

## 步骤 5：启用 GitHub Pages

1. 访问：https://github.com/chenniyang666/japan-trip-2026
2. 点击 `Settings` 标签
3. 在左侧菜单中找到 `Pages`
4. 在 `Build and deployment` 部分：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main`，目录选择 `/ (root)`
   - 点击 `Save`

5. 等待 1-2 分钟，页面会显示您的网站地址：
   ```
   🎉 Your site is live at:
   https://chenniyang666.github.io/japan-trip-2026/
   ```

---

## 🌐 访问您的网站

部署成功后，可以通过以下地址访问：

- **首页**: https://chenniyang666.github.io/japan-trip-2026/
- **行程表**: https://chenniyang666.github.io/japan-trip-2026/itinerary.html

---

## 📝 后续更新文件

如果您修改了 HTML 文件，重新部署的步骤：

```powershell
cd c:\Users\70927\WorkBuddy\20260407093217

# 查看修改
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

### Q1: 推送时提示 "Authentication failed"
**A**: 确认：
- 使用的是 PAT Token，不是 GitHub 密码
- Token 未过期
- Token 有 `repo` 权限

### Q2: GitHub Pages 显示 404
**A**: 
- 等待 2-3 分钟
- 检查 Pages 设置中 Branch 是否正确选择 `main`
- 查看 Actions 标签，看是否有构建错误

### Q3: 网页样式显示异常
**A**:
- 检查浏览器是否缓存旧版本（按 Ctrl+F5 强制刷新）
- 查看浏览器控制台是否有错误（按 F12 打开）

### Q4: 如何删除仓库
**A**:
- 仓库 → Settings → 滚动到底部 → "Delete this repository"
- 输入仓库名称确认删除

---

## 📱 分享链接

将以下链接分享给家人：

```
https://chenniyang666.github.io/japan-trip-2026/
```

---

## ✅ 完成检查清单

- [ ] 安装 Git
- [ ] 配置 Git 用户信息
- [ ] 创建 GitHub 仓库
- [ ] 初始化本地仓库
- [ ] 提交文件
- [ ] 推送到 GitHub
- [ ] 启用 GitHub Pages
- [ ] 访问网站确认显示正常
- [ ] 分享链接给家人

---

## 💡 提示

- GitHub Pages 是**完全免费**的
- 您的网站是**公开的**，任何人都可以访问
- 建议定期备份 HTML 文件到本地
- 如需更多帮助，参考：https://docs.github.com/en/pages
