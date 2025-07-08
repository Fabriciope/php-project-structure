FROM composer:2.8.9 AS composer

WORKDIR /app

COPY composer.json composer.json
COPY composer.lock composer.lock

# TODO: estudar --no-scripts
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist --no-progress

# TODO: usar alpine
FROM php:8.4.6-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && rm /usr/local/etc/php/php.ini-development

COPY docker/production/php-fpm/99-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
COPY docker/production/php-fpm/php-fpm-overrides.conf /usr/local/etc/php-fpm.d/php-fpm-overrides.conf

RUN apt-get update && apt install -y \
        libzip-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libcurl4-openssl-dev \
        # libpng-dev \
        # libjpeg-dev \
        # libfreetype6-dev \
        zip \
        unzip \
    # && pecl install \
    #     xdebug \
    # && docker-php-ext-enable \
    #     xdebug \
    # && docker-php-ext-configure gd \
    #     --with-freetype \
    #     --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www
COPY . .

COPY --from=composer /app/vendor vendor

CMD ["/bin/bash", "-c", "php-fpm"]
