FROM php:8.4-fpm

RUN set -eux; \
    apt-get update; \
    apt-get install -y unzip libpq-dev libicu-dev; \
    docker-php-ext-install intl pdo_pgsql; \
    pecl install xdebug; \
	docker-php-ext-enable xdebug;

COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini
COPY ./docker/php/.bashrc /root/.bashrc

COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# This docker image is optimised for local development and is not intended for production
# therefor we just create /api folder rather than copy code itself, expecting docker compose to mount local folder here
RUN mkdir -p /api
WORKDIR /api