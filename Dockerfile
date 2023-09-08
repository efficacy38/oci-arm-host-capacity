FROM composer:2.6.2

ADD . /app

WORKDIR /app

RUN composer install --no-dev --no-interaction --no-progress --no-suggest --optimize-autoloader --classmap-authoritative

ENTRYPOINT [ "/app/entrypoint.sh" ]
