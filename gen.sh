#!/bin/bash

# 指定目录下的文件路径
directory_path="image"

# 输出文件路径
output_file="output.yaml"

# 清空输出文件内容
echo "" > $output_file

# 输出模板内容
echo "template: custom" >> $output_file
echo "version:" >> $output_file
echo "  engine: 0.0.1" >> $output_file
echo "  git_repository: git_tag/commit_id" >> $output_file
echo "config:" >> $output_file
echo "  mime: image/png" >> $output_file
echo "  size:" >> $output_file
echo "    width: 64" >> $output_file
echo "    height: 64" >> $output_file
echo "  transparency: false" >> $output_file
echo "  option:" >> $output_file
echo "    user_selectable: false" >> $output_file
echo "suite:" >> $output_file


# 遍历目录下的文件，生成suite内容
nft_id=1
for file_path in $directory_path/*; do
  file_name=$(basename $file_path)
  echo "  - nft_id: $nft_id" >> $output_file
  echo "    file_name: '$file_name'" >> $output_file
  echo "    nft_trait:" >> $output_file
  echo "      - trait_type: a" >> $output_file
  echo "        display_type: string" >> $output_file
  echo "        value: foo" >> $output_file
  echo "      - trait_type: b" >> $output_file
  echo "        display_type: string" >> $output_file
  echo "        value: bar" >> $output_file
  echo "      - trait_type: c" >> $output_file
  echo "        display_type: string" >> $output_file
  echo "        value: zee" >> $output_file
  ((nft_id++))
done

echo "Generated suites in $output_file"