FROM nginx:1.28.0

COPY docker/production/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY . /var/www/project-name

WORKDIR /var/www/project-name/public

RUN chown -R nginx:nginx /var/www/project-name/public && chown -R nginx:nginx /var/www/project-name/storage/logs
