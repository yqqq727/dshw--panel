# 项目说明

## 📁 目录结构

```
dshw--panel/
├── data/
│   ├── raw/                    # 原始 CSMAR 数据（不上传到 GitHub）
│   ├── clean/                  # 清洗后的最终数据（上传）
│   │   └── final_panel.csv
│   └── processed/              # 中间处理数据（不上传）
├── notebooks/                 # Jupyter 分析笔记
│   ├── 数据预处理.ipynb
│   ├── 描述性统计.ipynb
│   ├── 模型估计.ipynb
│   └── 结果汇总与报告.ipynb
├── output/                     # 图表输出（上传）
└── README.md                  # 项目说明（上传）
```

## 🔑 重要说明

### Notebook 使用说明

**注意**：Notebooks 使用相对路径，确保在任何电脑上都能运行：

1. 解压 .zip 文档后，进入项目根目录
2. 打开任意 Notebook 即可直接运行
3. 数据路径已配置为相对路径

### 路径配置

```python
# 所有 Notebooks 使用此路径配置
CURRENT_DIR = Path.cwd()
RAW_DIR = CURRENT_DIR / "data" / "raw"
PROCESSED_DIR = CURRENT_DIR / "data" / "processed"
OUTPUT_DIR = CURRENT_DIR / "outputs" / "数据预处理"
```

### 环境要求

确保安装了以下 Python 包：

```bash
pip install pandas numpy matplotlib seaborn scipy pyfixest jupyter
```

## 📊 最终交付内容

- ✅ 4 个 Jupyter Notebooks
- ✅ 清洗后的数据集（data/clean/final_panel.csv）
- ✅ 图表输出（output/figures/）
- ✅ README.md（包含仓库和 Book 链接）
- ✅ .gitignore 配置（正确忽略原始数据）
- ✅ Quarto Book（可选加分项）

## 🎯 满足的要求

1. ✅ 全部 Notebook (.ipynb)
2. ✅ 不包含原始数据
3. ✅ 包含清洗后的数据
4. ✅ 包含分析结果
5. ✅ README.md 包含仓库和 Book 链接
6. ✅ Notebook 可直接运行（相对路径）
7. ✅ 仓库名称：dshw--panel

## 📈 GitHub 仓库

https://github.com/yqqq727/dshw--panel

## 📚 Quarto Book

https://yqqq727.github.io/dshw--panel/
