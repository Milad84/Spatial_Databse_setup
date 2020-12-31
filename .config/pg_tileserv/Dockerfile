FROM pramsey/pg_tileserv:20201218

COPY ./.config/wait-for-it.sh /app/wait-for-it.sh
USER root
RUN chmod +x wait-for-it.sh
USER 1001

# ENTRYPOINT ["./pg_tileserv"]

ENTRYPOINT ["./wait-for-it.sh", "exspda_postgis:5432", "--strict", "--timeout=60", "--", "./pg_tileserv"]
