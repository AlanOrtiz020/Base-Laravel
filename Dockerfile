FROM php:8.2.0-fpm-alpine

# Establecer directorio de trabajo
WORKDIR /var/www/app

# Instalar dependencias
RUN apk update && apk add --no-cache \
        oniguruma-dev \
        build-base \
        libjpeg-turbo-dev \
        libxml2-dev \
        unzip \
        git \
        curl \
        shadow \
        gcc \
        musl-dev \
        zlib-dev \
        jpeg-dev \
        freetype-dev \
        libpng-dev \
        libzip-dev \
        icu-dev \
        bash \
        nano \
        nodejs \
        npm

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install exif
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd
#dRUN docker-php-ext-install sockets
RUN docker-php-ext-install xml
RUN docker-php-ext-install zip
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache

RUN docker-php-ext-install mbstring

# Instalar composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Crear directorio para la aplicación
#RUN mkdir -p /var/www/app



# Exponer el puerto 9000 y establecer www-data como usuario
#EXPOSE 9000

# Permisos
USER root
RUN chmod 777 -R /var/www/app