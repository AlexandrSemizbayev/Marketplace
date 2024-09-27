cat ./sql/create_DB.sql ./sql/actions.sql > raw_init.sql
export $(grep -v '^#' environment.env | xargs) && \
  envsubst < ./sql/raw_init.sql > init.sql
rm raw_init.sql