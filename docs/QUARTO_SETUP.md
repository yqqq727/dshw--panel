# Quarto Book 设置指南

## 📋 前置要求

### 1. 安装 Quarto

#### Windows
```bash
# 下载并安装最新版 Quarto
# 访问: https://quarto.org/docs/download/
```

#### macOS
```bash
# 使用 Homebrew 安装
brew install quarto

# 或下载安装包
# 访问: https://quarto.org/docs/download/
```

#### Linux
```bash
# 使用包管理器安装
# Ubuntu/Debian
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb

# 或使用脚本安装
curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo apt-get install ./quarto-linux-amd64.deb
```

### 2. 验证安装

```bash
quarto --version
```

应显示版本号（如 1.4.550 或更高）。

### 3. 安装 Python 依赖

```bash
pip install jupyter pandas numpy matplotlib seaborn scipy pyfixest
```

### 4. （可选）安装 LaTeX

如果需要生成 PDF 版本：

#### Windows
安装 MiKTeX: https://miktex.org/download

#### macOS
```bash
brew install mactex
```

#### Linux
```bash
sudo apt-get install texlive-full
```

## 🚀 本地预览

### 启动开发服务器

```bash
# 进入项目目录
cd exP03

# 启动 Quarto 开发服务器
quarto preview
```

浏览器会自动打开 `http://localhost:4200/`（或其他端口）。

### 实时预览

- 修改 `.qmd` 文件后，浏览器会自动刷新
- 支持热重载（Hot Reload）
- 错误会实时显示在终端和浏览器中

## 📝 构建书籍

### 构建 HTML 版本

```bash
quarto render
```

生成文件在 `_book/` 目录。

### 构建 PDF 版本

```bash
quarto render --to pdf
```

### 同时构建 HTML 和 PDF

```bash
quarto render --to all
```

## 🔧 配置文件

### `_quarto.yml`

主要配置文件，定义书籍结构、格式选项等。

### `references.bib`

参考文献数据库（BibTeX 格式）。

### `custom.scss` / `styles.css`

自定义样式文件。

### `.github/workflows/publish.yml`

GitHub Actions 工作流配置。

## 📖 Quarto 语法基础

### 标题

```markdown
# 一级标题
## 二级标题
### 三级标题
```

### 代码块

\```python
import pandas as pd
df = pd.read_csv('data.csv')
\```

### 表格

```markdown
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 数据1 | 数据2 | 数据3 |
```

### 公式

行内公式：$E = mc^2$

块级公式：

$$
\beta = \frac{Cov(X,Y)}{Var(X)}
$$

### 图片

```markdown
![图片说明](path/to/image.png)
```

### 引用

```markdown
> 这是一个引用块
```

### 列表

无序列表：
- 项目1
- 项目2

有序列表：
1. 项目1
2. 项目2

## 🌐 部署到 GitHub Pages

### 方法1：使用 GitHub Actions（推荐）

1. **推送代码到 GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/exP03.git
git push -u origin main
```

2. **启用 GitHub Pages**
- 访问仓库的 Settings → Pages
- Source 选择 "GitHub Actions"

3. **自动部署**
- 每次推送到 `main` 分支会自动触发构建
- 构建成功后自动部署到 GitHub Pages
- 访问地址：`https://YOUR_USERNAME.github.io/exP03/`

### 方法2：手动部署

1. **本地构建**
```bash
quarto render
```

2. **推送 `_book` 目录**
```bash
git add _book/
git commit -m "Deploy book"
git push origin main
```

3. **配置 GitHub Pages**
- Settings → Pages
- Source 选择 "Deploy from a branch"
- Branch 选择 `main`，目录选择 `/_book`

## 🔍 故障排除

### 问题1：Quarto 未安装

**错误信息**：`quarto: command not found`

**解决方案**：
- 重新安装 Quarto
- 确保已添加到系统 PATH

### 问题2：Python 依赖缺失

**错误信息**：`ModuleNotFoundError: No module named 'pandas'`

**解决方案**：
```bash
pip install --upgrade pip
pip install jupyter pandas numpy matplotlib seaborn scipy pyfixest
```

### 问题3：图片路径错误

**错误信息**：`File not found: path/to/image.png`

**解决方案**：
- 检查图片路径是否正确
- 使用相对路径（相对于 `.qmd` 文件）
- 确保图片文件已提交到 Git

### 问题4：GitHub Actions 构建失败

**错误信息**：Build failed in Actions

**解决方案**：
- 检查 Actions 标签页的错误日志
- 确保 `_quarto.yml` 语法正确
- 验证所有 `.qmd` 文件可以正常渲染

### 问题5：PDF 生成失败

**错误信息**：`LaTeX error`

**解决方案**：
- 确保 LaTeX 已正确安装
- 尝试更新 LaTeX 包
- 检查是否有特殊字符需要转义

## 📚 更多资源

- **Quarto 官方文档**：https://quarto.org/
- **Quarto Book 指南**：https://quarto.org/docs/books/
- **Quarto GitHub Actions**：https://quarto.org/docs/publishing/github-pages.html
- **Quarto 语法参考**：https://quarto.org/docs/authoring/

## 🤝 获取帮助

如果遇到问题：

1. 查看 [Quarto FAQ](https://quarto.org/docs/faq/)
2. 搜索 [Quarto GitHub Issues](https://github.com/quarto-dev/quarto-cli/issues)
3. 在 [Quarto Discuss](https://github.com/quarto-dev/quarto-cli/discussions) 提问
4. 查看 [Stack Overflow](https://stackoverflow.com/questions/tagged/quarto)

---

**最后更新**：2026-04-24
