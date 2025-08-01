#!/bin/bash

echo "Rolling back backend..."

<<<<<<< HEAD
# This is a basic example — update based on your logic
ROLLBACK_DIR="/var/www/backend_backup"
DEPLOY_DIR="/var/www/backend"

if [ -d "$ROLLBACK_DIR" ]; then
  rm -rf $DEPLOY_DIR
  mv $ROLLBACK_DIR $DEPLOY_DIR
=======
DEPLOY_DIR="/home/jenkins/backend"
LATEST_BACKUP=$(ls -td /home/jenkins/backups/* | head -n1)

if [ -d "$LATEST_BACKUP" ]; then
  rm -rf "$DEPLOY_DIR"
  cp -r "$LATEST_BACKUP" "$DEPLOY_DIR"
>>>>>>> 6ebb232 (Fix: deploy scripts with correct permissions and rollback path)
  echo "Rollback successful!"
else
  echo "No backup found. Rollback failed."
fi
<<<<<<< HEAD
=======


>>>>>>> 6ebb232 (Fix: deploy scripts with correct permissions and rollback path)
