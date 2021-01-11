FROM php:8.0-fpm-alpine

RUN apk add --no-cache libzip-dev

RUN docker-php-ext-configure zip \
    && docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

CMD ["php-fpm"]
