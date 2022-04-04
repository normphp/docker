#!/bin/sh
# 处理环境
apk add -U tzdata
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone
apk del tzdata