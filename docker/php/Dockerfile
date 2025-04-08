ARG PHP_VERSION
FROM php:${PHP_VERSION}

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/mailhog/MailHog/releases/download/v1.0.1/MailHog_linux_amd64 -O /usr/local/bin/mailhog && \
    chmod +x /usr/local/bin/mailhog

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmariadb-dev \
    && docker-php-ext-configure mysqli \
    && docker-php-ext-install mysqli

COPY ./php-ini-overrides.ini /usr/local/etc/php/conf.d/