FROM nginx:1.28.0

COPY docker/development/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY . /var/www

WORKDIR /var/www/public
