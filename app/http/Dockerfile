FROM nginx:1.25-alpine

# Install PHP for dynamic menus
RUN apk add --no-cache php82 php82-fpm

# Copy configs
COPY php-fpm.conf /etc/php82/php-fpm.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Start PHP-FPM and nginx
CMD ["sh", "-c", "php-fpm82 && nginx -g 'daemon off;'"]