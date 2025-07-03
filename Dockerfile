FROM php:8.4.6-cli

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && rm /usr/local/etc/php/php.ini-development

WORKDIR /app

COPY ./../../. .

RUN apt-get update && apt install -y \
        libzip-dev \
        libonig-dev \
        libxml2-dev \
        zip \
        unzip \
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    && docker-php-ext-install \
        # pdo \
        # pdo_mysql \
        zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY --from=composer:2.2.6 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

CMD ["/bin/bash", "-c", "composer install --verbose && /bin/bash"]
