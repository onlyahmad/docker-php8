FROM php:8.1-fpm-alpine

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN sed -i "s/user = www-data/user = root/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = root/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN docker-php-ext-install pdo pdo_mysql

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS 
RUN apk add --update linux-headers \
 libjpeg-turbo-dev \
  libwebp-dev \
  libpng-dev
  # extention gd for compress image

RUN docker-php-ext-configure gd --with-jpeg
# RUN docker-php-ext-configure gd
# RUN docker-php-ext-install gd
RUN docker-php-ext-install -j$(nproc) gd
# RUN apk add php8.1-gd
   

USER root

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
