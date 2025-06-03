FROM php:8.4.6-cli

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && rm /usr/local/etc/php/php.ini-development

WORKDIR /app

COPY ./../../. .

RUN apt-get update && apt install -y libzip-dev unzip libcurl4-openssl-dev libonig-dev && \
    pecl install ds xdebug && \
    docker-php-ext-install zip opcache curl mbstring && \
    docker-php-ext-enable zip opcache curl mbstring ds xdebug && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.2.6 /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

CMD ["/bin/bash", "-c", "composer install --verbose && /bin/bash"]
