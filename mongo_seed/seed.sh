#!/bin/sh
mongoimport --host mongo --db $MONGO_DATABASE --collection users --type json --file ./mongo_seed/users.json --jsonArray > /seed/data/users_import.log 2>&1

echo "==> Checking connection to MongoDB at mongoimport --host mongo --db $MONGO_DATABASE --collection users --type json --file ./mongo_seed/users.json --jsonArray ..."

echo "==> users.json imported successfully."

mongoimport --host mongo --db $MONGO_DATABASE --collection products --type json --file ./mongo_seed/products.json --jsonArray  > /seed/data/products_import.log 2>&1

echo "==> products.json imported successfully."


echo "==> Seed finished!"