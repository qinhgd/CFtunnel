#!/system/bin/sh
ARCH=$(getprop ro.product.cpu.abi)
URL=""
case "$ARCH" in
  arm64-v8a|arm64*)
    URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
    ;;
  armeabi-v7a|arm*)
    URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm"
    ;;
  x86_64)
    URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
    ;;
  *)
    echo "不支持的架构: $ARCH"
    exit 1
    ;;
esac

echo "[*] 下载 Cloudflared 二进制: $URL"
curl -L "$URL" -o /data/adb/modules/cloudflared/core/cloudflared
chmod +x /data/adb/modules/cloudflared/core/cloudflared
