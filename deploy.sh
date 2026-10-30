#!/usr/bin/env bash
set -euo pipefail
# ElixirOffice 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/leag1234/ElixirOffice#try-it
# 更新日期：2026-10-30
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o ElixirOffice-0.5.0-x86_64.AppImage https://github.com/leag1234/elixiroffice/releases/download/v0.5.0/ElixirOffice-0.5.0-x86_64.AppImage
echo "282cbe4eb0e4c5a4ce82b06d374db6a1ab224c535042bdccb81618cd18d10be5  ElixirOffice-0.5.0-x86_64.AppImage" | sha256sum -c -
chmod +x ElixirOffice-0.5.0-x86_64.AppImage
echo "校验通过：运行 ./ElixirOffice-0.5.0-x86_64.AppImage"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/leag1234/ElixirOffice#try-it"
