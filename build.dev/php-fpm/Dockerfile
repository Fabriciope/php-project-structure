FROM php:8.4.6-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && rm /usr/local/etc/php/php.ini-production

COPY build.dev/php-fpm/99-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
COPY build.dev/php-fpm/php-fpm-overrides.conf /usr/local/etc/php-fpm.d/php-fpm-overrides.conf

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
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    # && docker-php-ext-configure gd \
    #     --with-freetype \
    #     --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# TODO: colocar build.prod no .docker.gitignore
COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www
COPY . .

CMD ["/bin/bash", "-c", "composer install --verbose && php-fpm"]
