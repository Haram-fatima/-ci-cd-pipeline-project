#!/bin/bash
set -e

<<<<<<< HEAD
# 🗂️  Backup and clean remote folder
=======
>>>>>>> 8c33995 (Updated Jenkinsfile and deploy scripts, added backend archive and monitoring setup)
ssh jenkins@10.108.66.161 << 'ENDSSH'
mkdir -p ~/app-backups
if [ -d ~/app-backend ]; then
  cp -r ~/app-backend ~/app-backups/backup_$(date +%F_%T)
fi
rm -rf ~/app-backend
mkdir ~/app-backend
ENDSSH

<<<<<<< HEAD
# 📦 Upload clean backend build
scp backend.tar.gz jenkins@10.108.66.161:~/app-backend/

# 🚀 Deploy on remote server
=======
scp backend.tar.gz jenkins@10.108.66.161:~/app-backend/

>>>>>>> 8c33995 (Updated Jenkinsfile and deploy scripts, added backend archive and monitoring setup)
ssh jenkins@10.108.66.161 << 'ENDSSH'
cd ~/app-backend
tar -xzf backend.tar.gz
npm install --production || true
pm2 stop all || true
pm2 start dist/main.js --name backend
ENDSSH
