# Cloudflared Magisk Module

## 功能

- 自动下载适配架构的 Cloudflared 二进制（支持 armv8）
- 使用 Cloudflare Tunnel Token 启动 cloudflared
- 启动前自动检测并使用 dnsmasq（Magisk 提供）
- 守护脚本 watchdog.sh 自动重启 cloudflared
- GitHub Actions 自动构建模块 zip

## 使用

1. 编辑 core/token 文件填入你的 Tunnel Token（不上传到 GitHub）
2. 打标签如 v2.3，自动构建 Magisk 模块 zip 包
3. 安装模块，reboot 后自动启动

## 目录说明

- core/cloudflared: 二进制（CI 自动下载）
- scripts/watchdog.sh: 守护逻辑
- scripts/auto_download.sh: 架构自动检测与下载
