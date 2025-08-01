#!/bin/bash
set -e
<<<<<<< HEAD
ssh jenkins@10.108.66.161 << 'ENDSSH'
# Rollback backend
latest_backup=$(ls -td ~/app-backups/* | head -1)
rm -rf ~/app-backend
cp -r "$latest_backup" ~/app-backend
pm2 restart all
=======
>>>>>>> 8c33995 (Updated Jenkinsfile and deploy scripts, added backend archive and monitoring setup)

ssh jenkins@10.108.66.161 << 'ENDSSH'
LATEST_BACKUP=$(ls -td ~/app-backups/* | head -1)
if [ -d "$LATEST_BACKUP" ]; then
  rm -rf ~/app-backend
  cp -r "$LATEST_BACKUP" ~/app-backend
  pm2 restart backend || true
else
  echo "No backup found to rollback!"
fi
ENDSSH

