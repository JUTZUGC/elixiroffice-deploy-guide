# ElixirOffice 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/leag1234/ElixirOffice#try-it
# 更新日期：2026-10-30
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o ElixirOffice-0.5.0-win-x64.exe https://github.com/leag1234/elixiroffice/releases/download/v0.5.0/ElixirOffice-0.5.0-win-x64.exe
$h=(Get-FileHash .\ElixirOffice-0.5.0-win-x64.exe -Algorithm SHA256).Hash.ToLower()
if ($h -ne "5ffb59a9d563c6586540c320d07e9d7f4c4a6af8930e92bd140ef385f5db65d5") { throw "SHA256 校验失败" }
Write-Host "校验通过：双击安装包完成安装"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/leag1234/ElixirOffice#try-it'
