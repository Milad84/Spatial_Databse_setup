FROM pramsey/pg_featureserv:20200408

COPY ./.config/wait-for-it.sh /app/wait-for-it.sh
USER root
RUN chmod +x wait-for-it.sh
USER 1001

# ENTRYPOINT ["./pg_featureserv"]

ENTRYPOINT ["./wait-for-it.sh", "exspda_postgis:5432", "--strict", "--timeout=60", "--", "./pg_featureserv"]
