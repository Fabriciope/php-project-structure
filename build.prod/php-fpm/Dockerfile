# TODO: usar alpine
FROM php:8.4.6-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && rm /usr/local/etc/php/php.ini-development

COPY build.prod/php-fpm/99-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
COPY build.prod/php-fpm/php-fpm-overrides.conf /usr/local/etc/php-fpm.d/php-fpm-overrides.conf

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

# TODO: usar multi-stage build para copiar a vendor
# TODO: colocar vendor no build/php-fpm/.dockerignore o vendor (./../../vendor/) e testar
# TODO: colocar build.dev no .docker.gitignore
COPY --from=composer:2.2.6 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www
COPY . .

CMD ["/bin/bash", "-c", "composer install --verbose && php-fpm"]
