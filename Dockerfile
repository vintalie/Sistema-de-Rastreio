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
    pip install --no-cache-dir -r requirements.txt && \
      apt-get remove -y \
        gcc \
        pkg-config && \
      rm -rf /var/lib/apt/lists/*

RUN pip install gunicorn
RUN pip install crispy_bootstrap4
RUN pip install django-allauth

COPY /app/* /app/

RUN apt-get install -y gunicorn

RUN useradd \
--comment "Application user" \
--no-create-home \
--system \
--user-group \
unicorn

COPY --chown=unicorn:unicorn --chmod=0640 app.py /srv/app.py

# Run phase
EXPOSE 8000
USER unicorn



