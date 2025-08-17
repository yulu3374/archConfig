#!/bin/bash

# 终止已运行的 polybar 实例
killall -q polybar

# 等待所有进程终止
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 启动 polybar
polybar example &
