# 🚀 Quarto Book 部署指南

## ✅ 已完成的配置

您的 Quarto Book 项目已完整配置，包括：

1. ✅ **Quarto 配置文件**：`_quarto.yml`
2. ✅ **6 个章节文件**：index.qmd, 01-data.qmd, 02-descriptive.qmd, 03-models.qmd, 04-results.qmd, 05-conclusion.qmd
3. ✅ **参考文献**：references.bib, references.qmd
4. ✅ **自定义样式**：custom.scss, styles.css
5. ✅ **GitHub Actions 工作流**：.github/workflows/publish.yml
6. ✅ **README 文档**：README.md（包含 Quarto Book 链接）

## 🌐 GitHub Pages 部署

### 步骤 1：安装 Quarto

```bash
# Windows: 下载安装包
# https://quarto.org/docs/download/

# macOS
brew install quarto

# Linux
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb
```

### 步骤 2：安装 Python 依赖

```bash
pip install jupyter pandas numpy matplotlib seaborn scipy pyfixest
```

### 步骤 3：本地测试

```bash
# 进入项目目录
cd exP03

# 启动开发服务器
quarto preview
```

浏览器会自动打开 `http://localhost:4200/`

### 步骤 4：推送代码到 GitHub

```bash
# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Add Quarto Book project"

# 设置远程仓库
git remote add origin https://github.com/yqqq727/exP03.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 步骤 5：启用 GitHub Pages

1. 访问您的 GitHub 仓库：https://github.com/yqqq727/exP03
2. 点击 **Settings**（设置）
3. 左侧菜单选择 **Pages**
4. **Build and deployment** 下：
   - **Source** 选择：`GitHub Actions`
5. 点击 **Save**

### 步骤 6：等待自动部署

- 推送代码后，GitHub Actions 会自动构建和部署
- 在 **Actions** 标签页可以查看构建进度
- 构建成功后（约 2-5 分钟），您的 Book 将在以下地址可用：

**👉 https://yqqq727.github.io/exP03/**

## 📝 项目结构

```
exP03/
├── _quarto.yml              # Quarto 配置文件
├── references.bib           # 参考文献（BibTeX）
├── custom.scss              # 自定义 SCSS 样式
├── styles.css               # 自定义 CSS 样式
├── README.md                # 项目说明
├── index.qmd                # 引言章节
├── 01-data.qmd              # 数据处理章节
├── 02-descriptive.qmd       # 描述性统计章节
├── 03-models.qmd            # 模型估计章节
├── 04-results.qmd           # 结果讨论章节
├── 05-conclusion.qmd        # 研究结论章节
├── references.qmd           # 参考文献章节
├── .github/
│   └── workflows/
│       └── publish.yml      # GitHub Actions 工作流
├── data/                    # 数据目录
├── notebooks/               # Jupyter 笔记本
└── outputs/                 # 输出文件
```

## 🔧 自定义配置

### 修改书籍标题

编辑 `_quarto.yml`：

```yaml
book:
  title: "您的书名"
  author: "您的姓名"
```

### 添加新章节

1. 创建新的 `.qmd` 文件（如 `06-appendix.qmd`）
2. 在 `_quarto.yml` 中添加：

```yaml
chapters:
  - index.qmd
  - 01-data.qmd
  # ...
  - 06-appendix.qmd  # 新增
```

### 修改主题

在 `_quarto.yml` 中修改 `theme`：

```yaml
format:
  html:
    theme:
      - cosmo        # 可选: default, cerulean, journal, flatly, etc.
      - custom.scss  # 自定义样式
```

## 📊 更新内容

### 本地预览更改

```bash
# 修改任何 .qmd 文件后
quarto preview
```

### 重新构建

```bash
# 构建 HTML
quarto render

# 构建 PDF
quarto render --to pdf
```

### 提交更改

```bash
git add .
git commit -m "Update book content"
git push origin main
```

推送后会自动触发重新部署。

## 🎨 自定义样式

### 修改配色

编辑 `custom.scss`：

```scss
/* 修改主色调 */
.navbar {
  background-color: #your-color;
}

/* 修改链接颜色 */
a {
  color: #your-color;
}
```

### 修改表格样式

编辑 `styles.css`：

```css
.table thead th {
  background-color: #your-color;
}
```

## 🔍 故障排除

### 构建失败

1. 检查 **Actions** 标签页的错误日志
2. 确保 `_quarto.yml` 语法正确
3. 验证所有 `.qmd` 文件可以正常渲染

### 本地预览问题

```bash
# 清理缓存
quarto clean

# 重新渲染
quarto render
```

### Python 依赖问题

```bash
# 重新安装依赖
pip install --upgrade jupyter pandas numpy matplotlib seaborn scipy pyfixest
```

## 📚 更多资源

- [Quarto 官方文档](https://quarto.org/)
- [Quarto Book 指南](https://quarto.org/docs/books/)
- [GitHub Actions 部署](https://quarto.org/docs/publishing/github-pages.html)

---

**您的 Quarto Book 链接**：https://yqqq727.github.io/exP03/

**最后更新**：2026-04-24
