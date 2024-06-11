FROM python:3.7
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY app/requirements.txt /app/

RUN apt-get update && \
    apt-get install -y \
      gcc \
      gunicorn \
      default-libmysqlclient-dev \
      pkg-config \
      curl && \
      pip install --upgrade pip --no-cache-dir && \
      pip install –r /app/requirements.txt --no-cache-dir && \
      apt-get remove -y \
        gcc \
        pkg-config && \
      rm -rf /var/lib/apt/lists/*

RUN pip install gunicorn
RUN pip install crispy_bootstrap4
RUN pip install django-allauth

COPY /app/* /app/

RUN python3 manage.py makemigrations 
RUN python3 manage.py migrate --noinput 
RUN python3 manage.py collectstatic --noinput 

CMD ["gunicorn", "--config" ,"appconsulta/gunicorn_conf.py", "aurigaone.wsgi:application"]

EXPOSE 8080:8080
