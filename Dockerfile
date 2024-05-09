# Use the official PHP image as base
FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    unzip \
    libzip-dev \
    curl

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql exif pcntl bcmath gd zip \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Copy existing application directory contents
COPY ./laravel-authentication-app /var/www/html

# Copy Nginx configuration file
COPY nginx/default.conf /etc/nginx/sites-available/default

# Create a symbolic link to enable the site
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM
CMD service nginx start && php-fpm