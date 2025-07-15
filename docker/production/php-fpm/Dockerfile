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
        pdo_mysql \
        zip \
        bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www/project-name
COPY . .

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN chown -R www-data:www-data /var/www/project-name

RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist --no-progress && php artisan optimize

CMD ["php-fpm", "-F"]
