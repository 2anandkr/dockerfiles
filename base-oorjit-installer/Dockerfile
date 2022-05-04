FROM php:7.4-fpm

ARG PHP_FPM_VERSION=7.4

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmemcached-dev zlib1g-dev \
        libmcrypt-dev \
        libxml2-dev \
        libzip-dev \
        libgeoip-dev \
        net-tools \
        msmtp \
    && docker-php-ext-configure \
        gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        -j$(nproc) gd \
        exif \
        opcache \
        calendar \
        soap \
        sockets \
        zip \
        bcmath \
        mysqli \
    # PECL extensions should be installed in series to fail properly if something went wrong
    && pecl install memcached-3.1.5 \
    && pecl install geoip-1.1.1 \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable \
        memcached \
        geoip \
        mcrypt \
    # Install the php ioncube loader
    && curl -L -o /tmp/ioncube_loaders_lin_x86-64.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar zxpf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /tmp \
    && mv /tmp/ioncube/ioncube_loader_lin_${PHP_FPM_VERSION}.so $(php -r "echo ini_get('extension_dir');")/ioncube_loader.so \
    && printf "zend_extension=ioncube_loader.so\n" > $PHP_INI_DIR/conf.d/0ioncube.ini \
    && rm -rf /tmp/ioncube* \
    # configure sendmail
    # echo "sendmail_path=/usr/bin/msmtp -t" >> $PHP_INI_DIR/conf.d/php-sendmail.ini \
    # Clear cache
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    # add user & group
    && groupadd -g 1000 www \
    && useradd -u 1000 -ms /bin/bash -g www www
