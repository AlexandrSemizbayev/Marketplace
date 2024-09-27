cat ./sql/create_DB.sql ./sql/actions.sql ./sql/fill_with_mocks.sql > raw_init.sql
export $(grep -v '^#' environment.env | xargs) && \
  envsubst < raw_init.sql > init.sql
rm raw_init.sql

cat init.sql