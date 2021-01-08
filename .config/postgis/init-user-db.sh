#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER hippo WITH SUPERUSER PASSWORD 'datalake';
    CREATE DATABASE hippo OWNER hippo;
    GRANT ALL PRIVILEGES ON DATABASE hippo TO hippo;
EOSQL