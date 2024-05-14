#!/bin/bash 
# Node JS version 
node="20.x"
#MongoDB version
mongoDB="6.0"

echo "
*******************************************************
 Initializing Server Config for MERN Stack 
*******************************************************
" && 
echo "
*******************************************************
Liste of instalLs : 
- Nginx
- NodeJs v ${node}
- Npm 
- Pm2
- MongoDB v ${mongoDB}

*******************************************************
" && 
echo "
*******************************************************
 STARTING PROCESS 
*******************************************************
" && 
sudo apt update && sudo apt upgrade -y &&

echo "
*******************************************************
 updated System 
*******************************************************
" && 

sudo apt-get install nginx -y && sudo systemctl enable nginx  &&

echo "
*******************************************************
 installed NGINX 
*******************************************************
" &&

curl -fsSL "https://deb.nodesource.com/setup_${node}.x" | sudo -E bash - &&\
sudo apt-get install -y nodejs &&echo "node version :" && node --version && echo "npm version :" && npm --version &&

echo "
*******************************************************
 installed Node ${node}
*******************************************************
" &&

npm install pm2 --location=global && pm2 status && pm2 startup &&

echo "
*******************************************************
 installed PM2 
*******************************************************
" &&


wget -qO - https://www.mongodb.org/static/pgp/server-${mongoDB}.asc | sudo apt-key add - && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/${mongoDB} multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${mongoDB}.list && sudo apt-get update && sudo apt-get install -y mongodb-org && sudo systemctl start mongod &&  mongod --version &&

echo "
*******************************************************
 installed MONGODB ${mongoDB} 
*******************************************************
" &&

sudo systemctl enable mongod.service && sudo chown -R mongodb:mongodb /var/lib/mongodb && sudo chown mongodb:mongodb /tmp/mongodb-27017.sock && sudo service mongod restart
echo "
*******************************************************
 initialization FINISHED 
*******************************************************
"