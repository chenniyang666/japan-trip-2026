# 🚀 GitHub Pages 启用步骤

## ⚠️ 当前问题

您的 GitHub Pages 还没有正确启用，所以网站返回 404 错误。

---

## ✅ 解决步骤（3 分钟）

### 第 1 步：打开 GitHub Pages 设置页面

在浏览器中打开：
```
https://github.com/chenniyang666/japan-trip-2026/settings/pages
```

---

### 第 2 步：配置 GitHub Pages

在 "Pages" 设置页面，按照以下步骤操作：

#### 2.1 找到 "Build and deployment" 区域

页面中间位置会看到：
```
Build and deployment
```

#### 2.2 设置 Source

找到 `Source` 选项（可能在显示 "None" 或其他内容）
- 点击 `Source` 右边的**下拉选择框**
- 选择：**`Deploy from a branch`**

#### 2.3 设置 Branch

选择 "Deploy from a branch" 后，会出现新的选项：
```
Branch: [选择框]  / (root) [选择框]
```

**操作：**
1. 点击第一个选择框，选择：**`main`**
2. 第二个选择框应该已经是 `/ (root)`，如果不是，选择 `/ (root)`

#### 2.4 保存设置

点击右侧的 **蓝色 `Save`** 按钮

---

### 第 3 步：等待部署（1-2 分钟）

点击 Save 后：
- 页面顶部会显示 "Pages updated successfully"
- 页面会刷新并显示部署状态
- 稍等 1-2 分钟，让 GitHub 完成部署

---

### 第 4 步：检查部署状态

在 "Pages" 设置页面，会看到一个绿色的状态框，类似：
```
🎉 Your site is live at:
https://chenniyang666.github.io/japan-trip-2026/
```

如果看到这个提示，说明部署成功！

---

## 🌐 访问您的网站

部署成功后，在浏览器中访问：
```
https://chenniyang666.github.io/japan-trip-2026/
```

您会看到：
- **首页**：日本行程预约清单
- **行程表**：点击 "查看详细行程表" 按钮，或访问：
  ```
  https://chenniyang666.github.io/japan-trip-2026/itinerary.html
  ```

---

## 🔍 如果还是不行

### 检查清单

- [ ] Source 是否选择了 "Deploy from a branch"
- [ ] Branch 是否选择了 "main"
- [ ] Directory 是否选择了 "/ (root)"
- [ ] 是否点击了 Save 按钮
- [ ] 页面是否显示 "Your site is live"

### 常见问题

**Q: 找不到 Source 选项？**
A: 向下滚动页面，"Build and deployment" 区域通常在页面中间或中下方

**Q: 找不到 main 分支？**
A: 确认仓库中是否正确推送了代码。访问：
   ```
   https://github.com/chenniyang666/japan-trip-2026/tree/main
   ```

**Q: 部署失败？**
A: 访问 Actions 页面查看错误：
   ```
   https://github.com/chenniyang666/japan-trip-2026/actions
   ```

---

## 📞 需要帮助？

如果按照以上步骤操作后仍然无法访问网站：

1. **截图发送给我**
   - 截图 GitHub Pages 设置页面
   - 我可以帮您判断是否配置正确

2. **检查 Actions 日志**
   - 访问：https://github.com/chenniyang666/japan-trip-2026/actions
   - 查看最近的 "pages build and deployment" 工作流
   - 如果有错误，截图给我

---

## ✅ 完成确认

当您成功访问网站后，告诉我：
- 网站是否正常显示
- 图片是否加载正常
- 两个页面（index.html 和 itinerary.html）是否都能打开

我会帮您最终验证部署结果！🎉
