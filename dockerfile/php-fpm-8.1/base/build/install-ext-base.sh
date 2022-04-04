apk add  --update --no-cache autoconf cmake make  gcc g++   \
                                   zlib-dev \
                                   icu-dev \
                                   libtool \
                                   libpq \
                                   rabbitmq-c \
                                   rabbitmq-c-dev \
                                   openssl-dev \
&&    echo -e "\033[5;34m pdo pdo_mysql  \033[0m"  \
&& docker-php-ext-install   pdo_mysql  \
&& echo -e "\033[5;34m  sockets  opcache  \033[0m" \
     && docker-php-ext-install sockets \
     && docker-php-ext-install opcache  \
&& echo -e "\033[5;34m  igbinary  \033[0m" \
     && pecl install             igbinary    \
     && docker-php-ext-enable    igbinary \
&& echo -e "\033[5;34m intl  bcmath gmp  \033[0m" \
     && apk add --update --no-cache gmp-dev \
     && docker-php-ext-install intl  bcmath gmp  \
&& echo -e "\033[5;34m  xlswriter 表格处理 \033[0m" \
     && pecl install             /home/build/package/xlswriter-1.5.1.tgz  \
     && docker-php-ext-enable    xlswriter  \
&& echo -e "\033[5;34m  redis  \033[0m" \
     && pecl install             /home/build/package/redis-5.3.7.tgz  \
     && docker-php-ext-enable    redis  \
&& echo -e "\033[5;34m swoole  \033[0m" \
     && printf "y\y\y" | pecl install      /home/build/package/swoole-4.8.7.tgz \
     && docker-php-ext-enable   swoole \
&& echo -e "\033[5;34m SSH2 \033[0m" \
     && cd /home/build/package/ && tar -zxvf libssh2-1.10.0.tar.gz && cd libssh2-1.10.0/  &&  ./configure && make && make install  \
     && pecl install                 /home/build/package/ssh2-1.3.1.tgz \
     && docker-php-ext-enable        ssh2 \
&& echo -e "\033[5;34m amqp  \033[0m" \
     && pecl install             /home/build/package/amqp-1.11.0.tgz  \
     && docker-php-ext-enable    amqp  \
&& echo -e "\033[5;34m xhprof  \033[0m" \
     && pecl install             /home/build/package/xhprof-2.3.5.tgz \
     && docker-php-ext-enable    xhprof  \
&& echo -e "\033[5;34m xdebug  \033[0m" \
     && pecl install             /home/build/package/xdebug-3.1.3.tgz \
     && docker-php-ext-enable    xdebug  \
&& apk del   cmake make  gcc g++ zlib-dev libtool   autoconf     \
&& apk del   rabbitmq-c-dev    openssl-dev \
&& apk del   xz  \
&& apk del   libpq