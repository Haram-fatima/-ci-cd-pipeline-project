#!/bin/bash
set -e
ssh jenkins@10.108.66.161 << 'ENDSSH'
mkdir -p ~/app-backups
cp -r ~/app-backend ~/app-backups/backup_$(date +%F_%T) || true
rm -rf ~/app-backend
mkdir ~/app-backend
ENDSSH

scp backend.tar.gz jenkins@10.108.66.161:~/app-backend/
ssh jenkins@ 10.108.66.161<< 'ENDSSH'
cd ~/app-backend
tar -xzf backend.tar.gz
cd dist
npm install --production || true
pm2 stop all || true
pm2 start main.js --name backend
ENDSSH

