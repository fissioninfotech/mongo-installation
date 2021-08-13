#!/bin/bash
if [ ! -f /usr/bin/mongod ]
    then
        apt-get update
        wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
        sudo apt-get install gnupg -y
        wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
        sudo apt-get update
        sudo apt-get install mongodb-org -y
        sudo mkdir -p /data/db
        sudo chown -R $USER /data/db 
        sudo chmod -R go+w /data/db
else
  echo "mongo db already installed.  Skipping..."
fi
mongo--version
# systemctl start mongodb
# systemctl status mongodb
