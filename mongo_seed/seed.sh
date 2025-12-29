#!/bin/sh

# Thử kết nối mongosh trước
echo "==> Testing connection to MongoDB ..."
mongosh "mongodb://usertest:Usertest%40123@192.168.20.163:9328/?directConnection=true" --eval "db.adminCommand('ping')"

if [ $? -eq 0 ]; then
    echo "==> Connection successful, importing data..."
    
    mongoimport --uri "mongodb://usertest:Usertest%40123@192.168.20.163:9328/test?directConnection=true" --collection users --type json --file /seed/users.json --jsonArray
    
    echo "==> users.json imported successfully."

    mongoimport --uri "mongodb://usertest:Usertest%40123@192.168.20.163:9328/test?directConnection=true" --collection products --type json --file /seed/products.json --jsonArray

    echo "==> products.json imported successfully."
else
    echo "==> Connection failed, cannot import data."
fi

echo "==> Seed finished!"
