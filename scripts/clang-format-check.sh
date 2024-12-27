#!/bin/bash
# Clang Format Check Script
# Usage: ./clang-format-check.sh <directory> <style>

# 引数が指定されていない場合はエラー
if [ -z "$1" ]; then
  echo "Error: No directory specified."
  exit 1
fi

DIRECTORY="$1"
STYLE="$2" # 事前に渡されたスタイル (デフォルトはGoogle)

# .clang-formatファイルがプロジェクトルートに存在するか確認
if [ -f ".clang-format" ]; then
  echo "Found .clang-format file. Ignoring provided style and using .clang-format."
  STYLE=""  # .clang-formatを使用するため、style変数を空に設定
else
  echo "No .clang-format file found. Using style: $STYLE"
fi

# 対象とするファイル拡張子
EXTENSIONS="*.cpp *.h *.hpp"

# 対象ファイルを検索してclang-formatを適用
for EXT in $EXTENSIONS; do
  find "$DIRECTORY" -type f -name "$EXT" -exec clang-format --style="$STYLE" --dry-run --Werror {} +
done

# ステータス確認
if [ $? -eq 0 ]; then
  echo "All files in $DIRECTORY are correctly formatted."
  exit 0
else
  echo "Formatting errors found in $DIRECTORY."
  exit 1
fi
