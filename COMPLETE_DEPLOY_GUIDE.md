# 🚀 Quarto Book 完整部署指南（解决 404 问题）

## ⚠️ 问题诊断

**当前状态**：项目尚未初始化为 Git 仓库

**404 错误原因**：代码没有推送到 GitHub，所以 GitHub Pages 无法部署

## ✅ 解决方案

### 步骤 1：初始化 Git 仓库

```bash
# 进入项目目录
cd exP03

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Quarto Book project"
```

### 步骤 2：连接到 GitHub 仓库

```bash
# 添加远程仓库
git remote add origin https://github.com/yqqq727/exP03.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

**如果遇到认证错误**：

```bash
# 方法 1：使用 GitHub CLI（推荐）
gh auth login
git push -u origin main

# 方法 2：使用 Personal Access Token
# 1. 访问 https://github.com/settings/tokens
# 2. 生成新的 token（勾选 repo 权限）
# 3. 使用 token 代替密码
git push -u origin main
# 用户名：yqqq727
# 密码：ghp_xxxxxxxxxxxx（你的 token）
```

### 步骤 3：启用 GitHub Pages

1. 访问 https://github.com/yqqq727/exP03/settings/pages
2. **Build and deployment** 部分：
   - **Source**: 选择 `GitHub Actions`
3. 点击 **Save**

### 步骤 4：等待自动部署

1. 访问 https://github.com/yqqq727/exP03/actions
2. 等待 "Publish Quarto Book" 工作流完成
3. 应该看到绿色勾 ✅（约 2-5 分钟）

### 步骤 5：访问您的 Quarto Book

**👉 https://yqqq727.github.io/exP03/**

## 🔍 验证部署成功

### 检查清单

- [ ] 代码已推送到 GitHub
- [ ] GitHub Actions 运行成功（绿色勾）
- [ ] 可以访问 https://yqqq727.github.io/exP03/
- [ ] 首页显示正常
- [ ] 导航菜单工作正常
- [ ] 各章节可以正常访问

### 测试各章节

- 主页：https://yqqq727.github.io/exP03/index.html
- 数据：https://yqqq727.github.io/exP03/01-data.html
- 描述性统计：https://yqqq727.github.io/exP03/02-descriptive.html
- 模型估计：https://yqqq727.github.io/exP03/03-models.html
- 结果讨论：https://yqqq727.github.io/exP03/04-results.html
- 结论：https://yqqq727.github.io/exP03/05-conclusion.html

## 🛠️ 常见问题

### 问题 1：git push 失败

**错误信息**：`fatal: remote origin already exists`

**解决方案**：
```bash
# 移除旧的远程仓库
git remote remove origin

# 添加新的远程仓库
git remote add origin https://github.com/yqqq727/exP03.git

# 重新推送
git push -u origin main
```

### 问题 2：认证失败

**错误信息**：`Authentication failed`

**解决方案**：

#### 方法 A：使用 GitHub CLI
```bash
# 安装 GitHub CLI
# Windows: winget install GitHub.cli
# macOS: brew install gh
# Linux: sudo apt install gh

# 登录
gh auth login

# 推送
git push -u origin main
```

#### 方法 B：使用 Personal Access Token
1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 点击 "Generate token"
5. 复制 token（只显示一次！）
6. 推送时使用 token 代替密码

### 问题 3：GitHub Actions 失败

**检查方法**：
1. 访问 https://github.com/yqqq727/exP03/actions
2. 点击失败的运行记录
3. 查看错误日志

**常见错误**：

#### 错误：Permission denied

**解决方案**：
1. 访问 https://github.com/yqqq727/exP03/settings/actions
2. 确保 "Workflow permissions" 设置为 "Read and write permissions"
3. 点击 Save

#### 错误：Quarto render failed

**解决方案**：
- 检查 `_quarto.yml` 语法
- 确保所有 `.qmd` 文件格式正确
- 本地测试：`quarto render`（需要先安装 Quarto）

### 问题 4：仍然显示 404

**检查清单**：

1. **等待足够时间**
   - GitHub Pages 需要时间来部署
   - 通常需要 1-2 分钟，有时可能更长

2. **清除浏览器缓存**
   ```
   Ctrl + Shift + Delete (Windows/Linux)
   Cmd + Shift + Delete (macOS)
   ```

3. **检查 URL**
   - 错误：https://yqqq727.github.io/
   - 正确：https://yqqq727.github.io/exP03/

4. **检查 GitHub Pages 设置**
   - 访问 https://github.com/yqqq727/exP03/settings/pages
   - Source 应该是 `GitHub Actions`
   - 不应该是 `Deploy from a branch`

5. **查看 GitHub Pages 状态**
   - 访问 https://www.githubstatus.com/
   - 确认 GitHub Pages 服务正常

## 📝 完整的一键部署脚本

### Windows (PowerShell)

```powershell
# 进入项目目录
cd exP03

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Quarto Book project"

# 添加远程仓库
git remote add origin https://github.com/yqqq727/exP03.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### macOS/Linux

```bash
# 进入项目目录
cd exP03

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Quarto Book project"

# 添加远程仓库
git remote add origin https://github.com/yqqq727/exP03.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

## 🎯 部署成功的标志

1. ✅ `git push` 成功完成
2. ✅ GitHub Actions 显示绿色勾
3. ✅ 可以访问 https://yqqq727.github.io/exP03/
4. ✅ 页面显示正常，没有 404 错误

## 📚 更新内容

### 本地修改后更新

```bash
# 1. 修改文件
# 使用任何编辑器编辑 .qmd 文件

# 2. 提交更改
git add .
git commit -m "Update book content"

# 3. 推送到 GitHub
git push origin main

# 4. 等待自动部署（约 2-5 分钟）

# 5. 刷新浏览器查看更新
```

## 🔗 有用链接

- **GitHub 仓库**：https://github.com/yqqq727/exP03
- **GitHub Actions**：https://github.com/yqqq727/exP03/actions
- **GitHub Pages 设置**：https://github.com/yqqq727/exP03/settings/pages
- **Quarto Book**：https://yqqq727.github.io/exP03/
- **GitHub 状态**：https://www.githubstatus.com/

## 💡 提示

1. **首次部署**：可能需要 5-10 分钟
2. **后续更新**：通常 2-5 分钟
3. **查看进度**：在 Actions 标签页查看实时进度
4. **清除缓存**：如果更新未显示，清除浏览器缓存
5. **使用无痕模式**：可以避免缓存问题

---

**完成这些步骤后，您的 Quarto Book 将在**：
**👉 https://yqqq727.github.io/exP03/**

**最后更新**：2026-04-24
