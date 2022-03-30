#!/bin/sh
# 处理环境
echo "Asia/Shanghai" > /etc/timezone \
    && apk add --update --no-cache tzdata shadow \
    && TZ=Asia/Shanghai \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime