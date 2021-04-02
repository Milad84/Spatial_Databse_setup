FROM postgis/postgis:13-3.1

LABEL maintainer="Nate Currit"

ENV PGROUTING_VERSION 3.1.2

# If impatient, comment out from here...
# RUN set -ex \
#  && apt-get update \
#  && apt-get install  -y --no-install-recommends \
#  build-essential \
#  g++ \
#  sqlite3 \
#  libsqlite3-dev \
#  libtiff5-dev \
#  curl \
#  pkg-config \
#  wget \
#  ca-certificates \
#  unzip

# RUN wget https://download.osgeo.org/proj/proj-7.2.0.tar.gz \
#  && tar xvzf proj-7.2.0.tar.gz \
#  && cd proj-7.2.0 \
#  && ./configure \
#     --without-curl \
#     --prefix=/usr/local \
#  && make && make install \
#  && cd ..

# RUN wget download.osgeo.org/gdal/3.0.4/gdal304.zip \
#  && unzip gdal304.zip \
#  && cd gdal-3.0.4 \
#  && ./configure \
#      --prefix=/usr/local \
#      --with-proj=/usr/local \
#      --with-pg=/usr/bin/pg_config \
#  && make clean && make && make install \
#  && export LD_LIBRARY_PATH=/usr/local/lib \
#  && gdalinfo --version
# ...to here

RUN set -ex \
 && apt-get update \
#  && apt-get install -y --no-install-recommends \
#         software-properties-common \
#  && add-apt-repository ppa:ubuntugis/ppa \
#  && apt-get update \
 && apt-cache showpkg python3 \
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
#  && apt-get install -y --no-install-recommends \
#         pgloader \
#         # If you comment out lines 8-35, comment out the following line, too.
#         gdal-bin \ 
#         postgresql-13-ogr-fdw \
 && rm -rf /var/lib/apt/lists/*
RUN echo '#!/bin/bash\n/usr/bin/python3' > /usr/bin/python \
    && chmod +x /usr/bin/python \ 
    && echo '#!/bin/bash\n/usr/bin/pip3' > /usr/bin/pip \
    && chmod +x /usr/bin/pip
RUN rm /docker-entrypoint-initdb.d/10_postgis.sh
COPY init-user-db.sh /docker-entrypoint-initdb.d/10-init-user-db.sh
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/11-initdb-postgis.sh