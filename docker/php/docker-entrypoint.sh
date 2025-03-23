#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

# Run only once to initialize the app
if [ ! -f /var/app/initalized ]; then
    echo "Initializing application"
    touch /var/app/initalized

    composer install --prefer-dist --no-progress --no-suggest --no-interaction

    php /api/artisan migrate
fi

exec docker-php-entrypoint "$@"
