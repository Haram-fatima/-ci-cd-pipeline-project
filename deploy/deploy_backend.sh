#!/bin/bash
set -e

# 🗂️  Backup and clean remote folder
ssh jenkins@10.108.66.161 << 'ENDSSH'
mkdir -p ~/app-backups
cp -r ~/app-backend ~/app-backups/backup_$(date +%F_%T) || true
rm -rf ~/app-backend
mkdir ~/app-backend
ENDSSH

# 📦 Upload clean backend build
scp backend.tar.gz jenkins@10.108.66.161:~/app-backend/

# 🚀 Deploy on remote server
ssh jenkins@10.108.66.161 << 'ENDSSH'
cd ~/app-backend
tar -xzf backend.tar.gz
npm install --production || true
pm2 stop all || true
pm2 start dist/main.js --name backend
ENDSSH
