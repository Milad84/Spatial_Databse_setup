#!/bin/bash
set -e

echo "Creating user $POSTGRES_PRIMARY_USER AND database $POSTGRES_PRIMARY_DB for user $POSTGRES_PRIMARY_USER"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER hippo WITH SUPERUSER PASSWORD 'datalake';
    CREATE DATABASE hippo OWNER hippo;
    GRANT ALL PRIVILEGES ON DATABASE hippo TO hippo;
EOSQL