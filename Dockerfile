FROM php:7.4-fpm-alpine

RUN apk --no-cache update \
    && apk --no-cache add libzip-dev \
    icu icu-dev icu-libs composer

RUN docker-php-ext-install zip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache

COPY conf.d/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

CMD ["php-fpm"]