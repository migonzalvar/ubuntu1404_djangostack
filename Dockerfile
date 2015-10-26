FROM shippableimages/ubuntu1404_base

MAINTAINER Miguel Gonzalez <migonzalvar@gmail.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    python \
    python-dev \
    python3.4 \
    python3.4-dev \
    python-setuptools \
    python-pip \
    python3-pip \
    python-virtualenv \
    python-psycopg2 \
    postgresql-9.4 \
    libpq-dev \
    postgresql-contrib-9.4 \
    && rm -f /var/lib/apt/lists/*
