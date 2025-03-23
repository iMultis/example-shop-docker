#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

if [ ! -f /api/composer.json ]; then
    echo "No API repository found. Please, clone https://github.com/iMultis/example-shop-api to api directory of the project."
    exit
fi

# Run only once to initialize the app
if [ ! -f /var/app/initalized ]; then
    echo "Initializing application"
    touch /var/app/initalized

    composer install --prefer-dist --no-progress --no-suggest --no-interaction

    cp /api/.env.example /api/.env
    php /api/artisan jwt:secret
    php /api/artisan migrate
fi

exec docker-php-entrypoint "$@"
