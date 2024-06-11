#!/bin/sh

python3 manage.py makemigrations && python3 manage.py migrate --noinput && python3 manage.py collectstatic --noinput && gunicorn --config appconsulta/gunicorn_conf.py aurigaone.wsgi:application