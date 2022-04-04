#!/bin/sh
echo -e "\033[5;34m 设置源、设置Asia/Shanghai 安装 shadow \033[0m"
cat /etc/alpine-release
echo "\033[5;34m 如依然下载缓慢可尝试替换域名为http://mirrors.ustc.edu.cn \033[0m"  \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.13/main"        > /etc/apk/repositories \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.13/community"    >> /etc/apk/repositories \
    && echo "https://mirrors.ustc.edu.cn/alpine/edge/community"     >> /etc/apk/repositories \
    && echo "https://mirrors.ustc.edu.cn/alpine/edge/main"          >> /etc/apk/repositories  \
    && echo "https://mirrors.ustc.edu.cn/alpine/edge/testing"       >> /etc/apk/repositories

apk update

mkdir -p /home/build/package

curl http://nomphp.pizepei.com/docker/package/libzip-1.8.0.tar.gz >>          /home/build/package/libzip-1.8.0.tar.gz
curl http://nomphp.pizepei.com/docker/package/redis-5.3.7.tgz >>              /home/build/package/redis-5.3.7.tgz
curl http://nomphp.pizepei.com/docker/package/swoole-4.8.7.tgz >>             /home/build/package/swoole-4.8.7.tgz
curl http://nomphp.pizepei.com/docker/package/xhprof-2.3.5.tgz >>             /home/build/package/xhprof-2.3.5.tgz
curl http://nomphp.pizepei.com/docker/package/xlswriter-1.5.1.tgz >>          /home/build/package/xlswriter-1.5.1.tgz
curl http://nomphp.pizepei.com/docker/package/amqp-1.11.0.tgz >>              /home/build/package/amqp-1.11.0.tgz
curl http://nomphp.pizepei.com/docker/package/xdebug-3.1.3.tgz >>             /home/build/package/xdebug-3.1.3.tgz
curl http://nomphp.pizepei.com/docker/package/libssh2-1.10.0.tar.gz >>        /home/build/package/libssh2-1.10.0.tar.gz
curl http://nomphp.pizepei.com/docker/package/ssh2-1.3.1.tgz >>               /home/build/package/ssh2-1.3.1.tgz

chmod +x /home/build/*
