FROM shippableimages/ubuntu1404_python

MAINTAINER Miguel Gonzalez <migonzalvar@gmail.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    python \
    python-dev \
    python-pip \
    python-psycopg2 \
    python-setuptools \
    python-virtualenv \
    python3-pip \
    python3.4 \
    python3.4-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN sudo echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > \
    /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -

RUN apt-get update && apt-get install -y \
    libpq-dev \
    postgresql-9.4 \
    postgresql-contrib-9.4 \
    postgresql-server-dev-9.4 \
    && rm -rf /var/lib/apt/lists/*

RUN echo "host all all localhost trust" > /etc/postgresql/9.4/main/pg_hba.conf \
    && echo "local all all trust" >> /etc/postgresql/9.4/main/pg_hba.conf

RUN service postgresql start \
    && su postgres -c 'createuser -dsr root'
