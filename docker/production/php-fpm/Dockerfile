FROM composer:2.8.9 AS composer

WORKDIR /app

COPY composer.json composer.json
# NOTE: adicionar composer.lock no contianer caso já exista
# COPY composer.lock composer.lock

# TODO: estudar --no-scripts
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist --no-progress


# TODO: usar alpine
FROM php:8.4.6-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN mv "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini" && rm "${PHP_INI_DIR}/php.ini-development"

COPY docker/production/php-fpm/99-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
COPY docker/production/php-fpm/php-fpm-overrides.conf /usr/local/etc/php-fpm.d/php-fpm-overrides.conf

RUN apt-get update && apt install -y \
        zip \
        unzip \
        libzip-dev \
        libonig-dev \
        libcurl4-openssl-dev \
    && docker-php-ext-install \
        zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www
COPY . .

COPY --from=composer /app/vendor vendor

RUN chown -R www-data:www-data /var/www

CMD ["php-fpm", "-F"]
