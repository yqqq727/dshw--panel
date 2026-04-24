# 🚀 GitHub 上传和部署完整指南

## 📋 准备工作

### 第 1 步：在 GitHub 上创建新仓库

1. 访问 https://github.com/new
2. **Repository name**：输入 `dshw--panel`
3. **Description**：`上市公司资本结构影响因素分析`
4. **Public** ✅ （选择公开）
5. **不要**勾选 "Add a README file"
6. **不要**勾选 "Add .gitignore"
7. 点击 **Create repository**

### 第 2 步：复制仓库地址

创建成功后，复制仓库的 HTTPS 地址：
```
https://github.com/yqqq727/dshw--panel.git
```

## 📤 上传代码到 GitHub

### Windows (PowerShell 或 Git Bash)

```powershell
# 进入项目目录
cd C:\Users\User\OneDrive\Desktop\exP03

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Capital Structure Analysis"

# 添加远程仓库
git remote add origin https://github.com/yqqq727/dshw--panel.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 如果遇到认证问题

#### 方法 1：使用 GitHub CLI（推荐）

```powershell
# 安装 GitHub CLI
winget install GitHub.cli

# 登录
gh auth login

# 重新推送
git push -u origin main
```

#### 方法 2：使用 Personal Access Token

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 点击 "Generate token"
5. **复制 token**（只显示一次！）

```powershell
# 推送时会提示输入用户名和密码
# 用户名：yqqq727
# 密码：ghp_xxxxxxxxxxxx（粘贴你的 token）
git push -u origin main
```

## ✅ 验证上传成功

### 检查清单

1. 访问 https://github.com/yqqq727/dshw--panel
2. 确认所有文件都已上传
3. **确认 data/raw/ 目录不存在**（已被 .gitignore 忽略）
4. 确认 data/clean/ 目录存在（包含清洗后的数据）
5. 确认所有 .qmd 文件已上传

### 应该上传的文件

```
✅ data/clean/final_panel.csv
✅ notebooks/
✅ output/
✅ outputs/
✅ *.qmd（所有 Quarto 章节）
✅ _quarto.yml
✅ references.bib
✅ custom.scss
✅ styles.css
✅ .gitignore
✅ README.md
```

### 不应该上传的文件

```
❌ data/raw/（原始数据，已被 .gitignore）
❌ *.log（日志文件）
❌ .ipynb_checkpoints/
❌ __pycache__/
❌ .DS_Store
```

## 🔧 启用 GitHub Pages

### 第 1 步：配置 GitHub Pages

1. 访问 https://github.com/yqqq727/dshw--panel/settings/pages
2. **Build and deployment** 部分：
   - **Source** 选择：`GitHub Actions`
3. 点击 **Save**

### 第 2 步：等待自动部署

1. 访问 https://github.com/yqqq727/dshw--panel/actions
2. 等待 "Publish Quarto Book" 工作流完成
3. 应该看到绿色勾 ✅（约 2-5 分钟）

### 第 3 步：访问您的 Quarto Book

**👉 https://yqqq727.github.io/dshw--panel/**

## 🔍 故障排除

### 问题 1：.gitignore 不生效

**原因**：文件已经被 Git 追踪

**解决方案**：

```powershell
# 清除 Git 缓存
git rm -r --cached .

# 重新添加文件
git add .

# 提交
git commit -m "Update .gitignore"

# 推送
git push origin main
```

### 问题 2：data/raw/ 仍然被上传

**检查 .gitignore**：

```powershell
# 查看 .gitignore 内容
cat .gitignore

# 应该包含：
# data/raw/
```

**手动移除已上传的原始数据**：

```powershell
# 从 Git 中移除（但保留本地文件）
git rm -r --cached data/raw

# 提交
git commit -m "Remove raw data from repository"

# 推送
git push origin main
```

### 问题 3：推送失败

**错误信息**：`failed to push some refs`

**解决方案**：

```powershell
# 强制推送（谨慎使用！）
git push -f origin main

# 或者先拉取再推送
git pull origin main --allow-unrelated-histories
git push origin main
```

### 问题 4：GitHub Pages 显示 404

**检查清单**：

1. ✅ 确认代码已推送成功
2. ✅ 确认 GitHub Actions 运行成功（绿色勾）
3. ✅ 确认 GitHub Pages 设置为 "GitHub Actions"
4. ✅ 等待足够时间（首次部署需要 5-10 分钟）
5. ✅ 访问正确的 URL：https://yqqq727.github.io/dshw--panel/

## 📊 验证 .gitignore 配置

### 检查 .gitignore 文件

```powershell
# 查看 .gitignore 内容
Get-Content .gitignore
```

应该包含：

```
# 原始数据（不上传到 GitHub）
data/raw/

# 清洗后的数据文件（Stata 格式）
data/clean/*.dta

# Python 缓存
__pycache__/

# Jupyter Notebook
.ipynb_checkpoints/

# 日志文件
*.log

# 操作系统文件
.DS_Store
```

### 验证文件状态

```powershell
# 查看哪些文件会被上传
git status

# 应该看到：
# 新文件：data/clean/final_panel.csv
# 被忽略：data/raw/（不应该出现）
```

## 🎯 完整的一键部署脚本

### Windows (PowerShell)

```powershell
# 设置变量
$repoName = "dshw--panel"
$username = "yqqq727"
$repoUrl = "https://github.com/$username/$repoName.git"

# 进入项目目录
cd C:\Users\User\OneDrive\Desktop\exP03

# 初始化 Git 仓库
git init

# 配置 .gitignore（如果需要）
"data/raw/" | Out-File -Encoding UTF8 -Append .gitignore
"*.log" | Out-File -Encoding UTF8 -Append .gitignore
".ipynb_checkpoints/" | Out-File -Encoding UTF8 -Append .gitignore

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Capital Structure Analysis"

# 添加远程仓库
git remote add origin $repoUrl

# 推送到 GitHub
git branch -M main
git push -u origin main

# 完成
Write-Host "✅ 上传成功！" -ForegroundColor Green
Write-Host "📦 仓库地址：$repoUrl" -ForegroundColor Cyan
Write-Host "📚 Quarto Book：https://$username.github.io/$repoName/" -ForegroundColor Yellow
```

## 📝 更新内容

### 本地修改后更新

```powershell
# 1. 修改文件（使用任意编辑器）

# 2. 查看修改
git status

# 3. 提交更改
git add .
git commit -m "Update book content"

# 4. 推送到 GitHub
git push origin main

# 5. 等待自动部署（约 2-5 分钟）

# 6. 刷新浏览器查看更新
```

## 🔗 有用链接

- **GitHub 仓库**：https://github.com/yqqq727/dshw--panel
- **GitHub Actions**：https://github.com/yqqq727/dshw--panel/actions
- **GitHub Pages 设置**：https://github.com/yqqq727/dshw--panel/settings/pages
- **Quarto Book**：https://yqqq727.github.io/dshw--panel/

## 💡 重要提示

### 关于数据安全

1. **原始数据不上传**：data/raw/ 目录已在 .gitignore 中
2. **仅上传清洗后的数据**：data/clean/final_panel.csv
3. **检查敏感信息**：确保数据中不包含敏感信息

### 关于 GitHub Pages

1. **公开访问**：Public 仓库的 GitHub Pages 任何人都可以访问
2. **自动部署**：每次推送代码后自动重新部署
3. **版本控制**：所有修改都有历史记录

### 关于 Quarto Book

1. **实时更新**：推送代码后 2-5 分钟自动更新
2. **永久链接**：https://yqqq727.github.io/dshw--panel/
3. **可下载 PDF**：访问后可导出 PDF 版本

---

**完成这些步骤后，您的项目将在 GitHub 上可见，Quarto Book 将自动上线！** 🎉

**最后更新**：2026-04-24
