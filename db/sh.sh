# chmod +x ./init/local.sh
# ./init/local.sh
docker kill postgresql-container
docker rm postgresql-container
# echo "READY"
# cp -a ../.env ./environment.env
# export $(grep -v '^#' environment.env | xargs) && \
#   envsubst < create_DB.sql > create_DB_filled.sql
# export $(grep -v '^#' environment.env | xargs) && \
#   envsubst < fill_with_mocks.sql > mocks.sql
# cat create_DB_filled.sql mocks.sql > init.sql
# rm create_DB_filled.sql
# rm mocks.sql
# ls
# cat ./environment.env
# echo "COPIED"
docker build -t postgre .
docker run -p 5436:5432 --name postgresql-container postgre