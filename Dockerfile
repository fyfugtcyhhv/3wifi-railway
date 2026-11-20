FROM php:8.2-apache
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libxml2-dev \
    && docker-php-ext-install bcmath curl mysqli simplexml \
    && a2enmod rewrite \
    && sed -i 's/Listen 80/Listen ${PORT:-80}/' /etc/apache2/ports.conf \
    && sed -i 's/:80>/:${PORT:-80}>/' /etc/apache2/sites-available/000-default.conf \
    && rm -rf /var/lib/apt/lists/*
