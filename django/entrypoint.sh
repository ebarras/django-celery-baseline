#!/bin/sh

if [ "$POSTGRES_DB" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# python manage.py flush --no-input
# python manage.py migrate

# These can be run manually instead:
# docker-compose exec web python manage.py flush --no-input
# docker-compose exec web python manage.py migrate

exec "$@"