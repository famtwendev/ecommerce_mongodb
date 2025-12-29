#!/usr/bin/env bash

# Thư mục lưu log/gom dữ liệu
mkdir -p /seed/data

echo "==> Starting MongoDB seed..."

# Kiểm tra kết nối MongoDB
echo "==> Checking connection to MongoDB at $MONGO_HOST:$MONGO_PORT ..."
mongosh --host "$MONGO_HOST" --port "$MONGO_PORT" \
  -u "$MONGO_USERNAME" -p "$MONGO_PASSWORD" \
  --authenticationDatabase "$MONGO_DATABASE" \
  --eval "print('connected')" > /seed/data/mongo_check.log 2>&1

if [ $? -ne 0 ]; then
    echo "==> ERROR: Cannot connect to MongoDB at $MONGO_HOST:$MONGO_PORT."
    echo "==> See /seed/data/mongo_check.log for details."
    exit 1
fi

echo "==> MongoDB is reachable, starting import..."

# Import users.json
mongoimport --host "$MONGO_HOST" --port "$MONGO_PORT" \
  -u "$MONGO_USERNAME" -p "$MONGO_PASSWORD" \
  --authenticationDatabase "$MONGO_DATABASE" \
  --db "$MONGO_DATABASE" --collection users --type json \
  --file /seed/users.json --jsonArray \
  > /seed/data/users_import.log 2>&1

if [ $? -ne 0 ]; then
    echo "==> ERROR: Failed to import users.json."
    echo "==> See /seed/data/users_import.log"
    exit 1
fi
echo "==> users.json imported successfully."

# Import products.json
mongoimport --host "$MONGO_HOST" --port "$MONGO_PORT" \
  -u "$MONGO_USERNAME" -p "$MONGO_PASSWORD" \
  --authenticationDatabase "$MONGO_DATABASE" \
  --db "$MONGO_DATABASE" --collection products --type json \
  --file /seed/products.json --jsonArray \
  > /seed/data/products_import.log 2>&1

if [ $? -ne 0 ]; then
    echo "==> ERROR: Failed to import products.json."
    echo "==> See /seed/data/products_import.log"
    exit 1
fi
echo "==> products.json imported successfully."

echo "==> Seed finished!"

