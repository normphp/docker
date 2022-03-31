#!/bin/sh
apk add  --no-cache autoconf cmake make  gcc g++   \
                                   zlib-dev \
                                   icu-dev \
                                   libtool \
                                   libpq \
                                   bzip2-dev bzip2

/home/build/package-diy.sh

echo -e "\033[5;34m pdo pdo_mysql  \033[0m"  \
    && docker-php-ext-install   pdo_mysql  \
    && echo -e "\033[5;34m pdo  pdo_pgsql \033[0m"  \
    && apk add  --update --no-cache postgresql-dev    \
    && docker-php-ext-install    pdo_pgsql

echo -e "\033[5;34m  docker-php-ext-install 安装php 扩展 （常规）  \033[0m" \
     && docker-php-ext-install sockets \
     && docker-php-ext-install opcache

echo -e "\033[5;34m  pecl install 安装php 扩展 （常规）  \033[0m" \
     && pecl install             igbinary    \
     && docker-php-ext-enable    igbinary

echo -e "\033[5;34m  数学扩展  \033[0m" \
     && apk add --update --no-cache gmp-dev \
     && docker-php-ext-install intl  bcmath gmp \

echo -e "\033[5;34m  xlswriter 表格处理 \033[0m" \
     && pecl install             /home/build/package/xlswriter-1.5.1.tgz  \
     && docker-php-ext-enable    xlswriter

echo -e "\033[5;34m  redis  \033[0m" \
     && pecl install             /home/build/package/redis-5.3.7.tgz  \
     && docker-php-ext-enable    redis


echo -e "\033[5;34m 非必要扩展 swoole  \033[0m" \
     && printf "y\y\y" | pecl install      /home/build/package/swoole-4.8.7.tgz \
     && docker-php-ext-enable   swoole

echo -e "\033[5;34m  非必要扩展 文件 ZIP    https://libzip.org/download/libzip-1.8.0.tar.gz \033[0m" \
     && apk add --update --no-cache  bzip2-dev bzip2 \
     && cd /home/build/package/ && tar -zxvf libzip-1.8.0.tar.gz  && cd libzip-1.8.0  && mkdir build  && cd build  && cmake ..  && make && make install \
     && export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig/:$PKG_CONFIG_PATH  \
     && docker-php-ext-install zip

echo -e "\033[5;34m 非必要扩展 amqp  \033[0m" \
     && pecl install             /home/build/package/amqp-1.11.0.tgz  \
     && docker-php-ext-enable    amqp



echo -e "\033[5;34m 非必要扩展 xhprof  \033[0m" \
     && pecl install             /home/build/package/xhprof-2.3.5.tgz \
     && docker-php-ext-enable    xhprof

echo -e "\033[5;34m 非必要扩展  \033[0m" \
     && pecl install             /home/build/package/xdebug-3.1.3.tgz \
     && docker-php-ext-enable    xdebug

apk del   postgresql-dev
apk del   bzip2-dev bzip2
apk del   cmake make  gcc g++ zlib-dev libtool   autoconf   icu-dev
apk del   xz

