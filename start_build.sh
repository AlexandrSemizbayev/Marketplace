echo "👋 You are running this script in $1 mode 👋"

echo "Sourcing fs_manipulations.sh"
chmod +x ./fs_manipulations.sh
source ./fs_manipulations.sh

echo "Generating mock items"

node ./db/init/scripts/mocks/generateItems.mjs

echo "Joining files"

extend_file ./db/init/sql/fill_with_mocks_extendable.sql ./db/init/scripts/mocks/results/item.sql ./db/init/sql/fill_with_mocks.sql

echo "removing old init.sql"

rm ./db/init.sql

echo "copying .env"
cp -a ./.env ./db/init/environment.env
echo "entering ./db/init"
cd ./db/init
ls
echo "making shell script executable and running it"
chmod +x ./scripts/$1.sh
./scripts/$1.sh

echo "entering ./db or ../"

cd ../
ls
echo "moving init.sql to ./db"
mv ./init/init.sql ./
cd ../
echo "entering root or ../"

docker-compose down --rmi all --volumes

docker-compose up

