FROM php:8.4.6-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN mv "${PHP_INI_DIR}/php.ini-development" "${PHP_INI_DIR}/php.ini" && rm "${PHP_INI_DIR}/php.ini-production"

COPY docker/development/php-fpm/99-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
COPY docker/development/php-fpm/php-fpm-overrides.conf /usr/local/etc/php-fpm.d/php-fpm-overrides.conf

RUN apt-get update && apt install -y \
        zip \
        unzip \
        libzip-dev \
        libonig-dev \
        libcurl4-openssl-dev \
        # libxml2-dev \
        # libpng-dev \
        # libjpeg-dev \
        # libfreetype6-dev \
    && pecl install \
        # ds \
        xdebug \
    && docker-php-ext-enable \
        # ds \
        xdebug \
    # && docker-php-ext-configure gd \
    #     --with-freetype \
    #     --with-jpeg \
    && docker-php-ext-install \
        pdo_mysql \
        zip \
        bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/project-name
COPY . .

CMD ["/bin/bash", "-c", "composer install --prefer-dist --no-interaction && php-fpm"]
