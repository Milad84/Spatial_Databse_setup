#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load PostGIS into both template_database and $POSTGRES_DB
# for DB in template_postgis "$POSTGRES_DB"; do
for DB in "$POSTGRES_PRIMARY_DB"; do
	# echo "Creating Schemas and loading PostGIS extensions into $DB"
	echo "Creating Schemas in $DB"
	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		CREATE SCHEMA AUTHORIZATION hippo;
		CREATE SCHEMA postgis AUTHORIZATION hippo;
		CREATE SCHEMA topology AUTHORIZATION hippo;
		CREATE SCHEMA pgrouting AUTHORIZATION hippo;
		CREATE SCHEMA fuzzystrmatch AUTHORIZATION hippo;
		CREATE SCHEMA address_standardizer AUTHORIZATION hippo;
		CREATE SCHEMA address_standardizer_data_us AUTHORIZATION hippo;
		CREATE SCHEMA tiger AUTHORIZATION hippo;
	EOSQL
	echo "Creating PostGIS extensions in $DB"
	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_raster SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_sfcgal SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_topology SCHEMA topology;
		CREATE EXTENSION IF NOT EXISTS pgrouting SCHEMA pgrouting;
		CREATE EXTENSION IF NOT EXISTS fuzzystrmatch SCHEMA fuzzystrmatch;
		CREATE EXTENSION IF NOT EXISTS address_standardizer SCHEMA address_standardizer;
		CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us SCHEMA address_standardizer_data_us;
		CREATE EXTENSION IF NOT EXISTS plpython3u;
	EOSQL

	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		ALTER DATABASE hippo SET search_path = hippo, public, postgis, topology, pgrouting, fuzzystrmatch, address_standardizer, address_standardizer_data_us;
	EOSQL
	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder SCHEMA tiger;
		ALTER DATABASE hippo SET search_path = hippo, public, postgis, topology, pgrouting, fuzzystrmatch, address_standardizer, address_standardizer_data_us, postgis_tiger_geocoder;
		REASSIGN OWNED BY postgres TO hippo;
	EOSQL
done
