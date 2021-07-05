FROM python:3.8-slim-buster

WORKDIR /var/www/app

COPY ./src/requirements.txt /var/www/app

RUN python -m pip install -r /var/www/app/requirements.txt

COPY ./src/. /var/www/app

EXPOSE 5000

CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:5000", "app:app"]