FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    supervisor \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip unzip git curl

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create application folder
WORKDIR /var/www
COPY . /var/www

# Set permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Install Laravel dependencies
RUN composer install

# Copy nginx and supervisord config
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 80

CMD ["/usr/bin/supervisord"]
