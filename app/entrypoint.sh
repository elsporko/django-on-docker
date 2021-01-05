#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started"
fi

# Commenting out so db is not flushed and migrated every
# time a container (re)starts.
#
# Command line equivaluents:
#   docker-compose exec web python manage.py flush --noinput
#   docker-compose exec web python manage.py migrate
# 
# python manage.py flus --no-input
# python manage.py migrate

exec "$@"
