FROM postgis/postgis:13-3.1

LABEL maintainer="Nate Currit"

ENV PGROUTING_VERSION 3.1.2

RUN set -ex \
 && apt-get update \
#  && apt-cache showpkg python3 \
 && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
       #  build-essential libssl-dev libffi-dev python3-dev \
 && apt-cache showpkg postgresql-plpython3-13 \
 && apt-get install -y --no-install-recommends \
        postgresql-plpython3-13 \
 && apt-cache showpkg postgresql-13-pgrouting \
 && apt-get install -y --no-install-recommends \
        postgresql-13-pgrouting \
        postgresql-13-pgrouting-scripts \
 && rm -rf /var/lib/apt/lists/*
RUN echo '#!/bin/bash\n/usr/bin/python3' > /usr/bin/python \
    && chmod +x /usr/bin/python \ 
    && echo '#!/bin/bash\n/usr/bin/pip3' > /usr/bin/pip \
    && chmod +x /usr/bin/pip
RUN rm /docker-entrypoint-initdb.d/10_postgis.sh
COPY init-user-db.sh /docker-entrypoint-initdb.d/10-init-user-db.sh
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/11-initdb-postgis.sh