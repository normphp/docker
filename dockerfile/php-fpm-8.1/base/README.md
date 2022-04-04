# php-fpm-8.1-base
docker buildx build --platform linux/amd64 -t  normphp/php:8.1.4-fpm-alpine3.15-baes --no-cache  --push .
docker buildx build --platform linux/arm64 -t  normphp/php:8.1.4-fpm-alpine3.15-baes --no-cache  --push .