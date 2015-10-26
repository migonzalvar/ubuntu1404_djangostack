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
    wget

RUN sudo echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > \
    /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -

RUN apt-get update && apt-get install -y \
    postgresql-9.4 \
    libpq-dev \
    postgresql-contrib-9.4
