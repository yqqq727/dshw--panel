# 🔧 Quarto Book 404 错误修复指南

## ✅ 已修复的问题

### 1. 添加了正确的网站配置

在 `_quarto.yml` 中添加了：

```yaml
website:
  title: "上市公司资本结构影响因素分析"
  site-url: "https://yqqq727.github.io/exP03"
  repo-url: "https://github.com/yqqq727/exP03"
  repo-actions: [edit, issue]
  search:
    location: navbar
    type: textbox
```

### 2. 创建了 .nojekyll 文件

添加了 `.nojekyll` 文件，告诉 GitHub Pages 不要使用 Jekyll 处理。

### 3. 更新了作者信息

将作者从 "XXX" 更新为 "曾悦晴 CHAN YUE QING"。

## 🚀 重新部署步骤

### 步骤 1：提交更改

```bash
git add .
git commit -m "Fix 404 error: update site-url and add .nojekyll"
git push origin main
```

### 步骤 2：等待 GitHub Actions 完成

1. 访问 https://github.com/yqqq727/exP03/actions
2. 等待构建完成（约 2-5 分钟）
3. 确保显示绿色勾 ✅

### 步骤 3：清除浏览器缓存

1. 按 `Ctrl + Shift + Delete`
2. 清除浏览器缓存
3. 或使用无痕模式访问

### 步骤 4：访问正确的 URL

**正确的 URL**：
- 主页：https://yqqq727.github.io/exP03/
- 引言章节：https://yqqq727.github.io/exP03/index.html
- 数据章节：https://yqqq727.github.io/exP03/01-data.html

**注意**：URL 末尾的 `/` 很重要！

## 🔍 其他可能的问题

### 问题 1：GitHub Actions 失败

**检查方法**：
1. 访问 https://github.com/yqqq727/exP03/actions
2. 点击最新的运行记录
3. 查看错误信息

**常见错误**：

#### 错误：Quarto not found

**解决方案**：工作流会自动安装 Quarto，无需担心。

#### 错误：Python dependencies

**解决方案**：工作流会自动安装依赖，但如果有问题，检查 `publish.yml` 中的包名。

### 问题 2：_book 目录未生成

**检查方法**：
```bash
# 在本地运行（需要先安装 Quarto）
quarto render

# 检查是否生成了 _book 目录
ls -la _book/
```

**解决方案**：
```bash
# 清理并重新生成
quarto clean
quarto render
```

### 问题 3：GitHub Pages 设置错误

**检查方法**：
1. 访问 https://github.com/yqqq727/exP03/settings/pages
2. 确认以下设置：
   - **Source**: GitHub Actions
   - **Branch**: 不应该选择（使用 Actions 时）
   - **Folder**: 不应该选择（使用 Actions 时）

**解决方案**：
1. 如果 Source 不是 "GitHub Actions"，改为 "GitHub Actions"
2. 保存设置
3. 重新推送代码触发构建

### 问题 4：仓库名称不匹配

**您的设置**：
- GitHub 用户名：`yqqq727`
- 仓库名称：`exP03`
- 正确的 URL：`https://yqqq727.github.io/exP03/`

**如果仓库名称不同**：
- 如果仓库是 `yqqq727.github.io`，URL 应该是 `https://yqqq727.github.io/`
- 如果仓库是 `blog`，URL 应该是 `https://yqqq727.github.io/blog/`

## 📋 完整的检查清单

- [ ] 已推送最新代码到 GitHub
- [ ] GitHub Actions 构建成功（绿色勾）
- [ ] GitHub Pages Source 设置为 "GitHub Actions"
- [ ] 浏览器缓存已清除
- [ ] 访问的 URL 包含仓库名称：`/exP03/`
- [ ] URL 末尾有 `/`
- [ ] 已创建 `.nojekyll` 文件
- [ ] `_quarto.yml` 中配置了 `site-url`

## 🎯 快速修复命令

```bash
# 1. 确保所有更改已提交
git add .
git commit -m "Fix 404 error"
git push origin main

# 2. 等待 2-5 分钟

# 3. 访问以下 URL 测试：
# https://yqqq727.github.io/exP03/
```

## 🔗 有用的链接

- **GitHub Actions**: https://github.com/yqqq727/exP03/actions
- **GitHub Pages 设置**: https://github.com/yqqq727/exP03/settings/pages
- **Quarto Book**: https://yqqq727.github.io/exP03/

## 📞 仍然无法解决？

1. **查看 GitHub Actions 日志**
   - 访问 Actions 标签页
   - 点击失败的运行
   - 截图错误信息

2. **本地测试**
   ```bash
   # 安装 Quarto
   # https://quarto.org/docs/download/

   # 本地渲染
   quarto render

   # 本地预览
   quarto preview
   ```

3. **查看 GitHub Pages 状态**
   - 访问 https://www.githubstatus.com/
   - 确认 GitHub Pages 服务正常

---

**修复后，您的 Book 应该在**：https://yqqq727.github.io/exP03/

**最后更新**：2026-04-24
