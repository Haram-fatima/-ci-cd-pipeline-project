#!/bin/bash
set -e

# Remote Jenkins Server IP
SERVER_IP="10.108.66.161"
REMOTE_USER="jenkins"

# Backup and prepare backend deployment
ssh $REMOTE_USER@$SERVER_IP << 'ENDSSH'
mkdir -p ~/app-backups
if [ -d ~/backend ]; then
  cp -r ~/backend ~/app-backups/backup_$(date +%F_%T)
  rm -rf ~/backend
fi
mkdir ~/backend
ENDSSH

# Copy the built backend package
scp backend.tar.gz $REMOTE_USER@$SERVER_IP:~/backend/

# Extract and start the app
ssh $REMOTE_USER@$SERVER_IP << 'ENDSSH'
cd ~/backend
tar -xzf backend.tar.gz
cd dist
npm install --production || true
pm2 stop backend || true
pm2 start main.js --name backend
ENDSSH
