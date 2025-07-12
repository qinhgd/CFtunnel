#!/system/bin/sh
# v2.3: 优化 dnsmasq 清理逻辑，在 cloudflared 成功重启后立即关闭 dnsmasq。
...
# === 主循环 ===
# === 预备工作 (确保在主循环开始前执行一次) ===
# 确保必要的子目录存在
mkdir -p "$CORE_DIR"
mkdir -p "$LOG_DIR"

log_watchdog "监控服务已启动 (v2.3)。"

# 注册清理函数，在脚本退出时自动执行
trap cleanup_dnsmasq_instance EXIT

while true; do
    if ! pgrep -f "$CLOUDFLARED tunnel" >/dev/null; then
        log_watchdog "cloudflared 进程未运行。"
        start_cloudflared
    fi
    sleep 60
done
