#!/bin/bash
# Quarto Book 404 修复脚本

echo "=== Quarto Book 404 错误修复 ==="
echo ""
echo "步骤 1：检查 Git 状态"
git status

echo ""
echo "步骤 2：添加所有更改"
git add .

echo ""
echo "步骤 3：提交更改"
git commit -m "Fix 404 error: update site-url and add .nojekyll"

echo ""
echo "步骤 4：推送到 GitHub"
git push origin main

echo ""
echo "=== 接下来 ==="
echo "1. 访问 https://github.com/yqqq727/exP03/actions"
echo "2. 等待构建完成（约 2-5 分钟）"
echo "3. 确认构建成功（绿色勾）"
echo "4. 访问 https://yqqq727.github.io/exP03/"
echo ""
echo "如果仍然 404，请检查："
echo "- GitHub Pages 设置：https://github.com/yqqq727/exP03/settings/pages"
echo "- Source 应该是：GitHub Actions"
echo ""
echo "完成！"
