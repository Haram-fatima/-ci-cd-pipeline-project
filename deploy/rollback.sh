#!/bin/bash

echo "Rolling back backend..."

DEPLOY_DIR="/home/jenkins/backend"
LATEST_BACKUP=$(ls -td /home/jenkins/backups/* | head -n1)

if [ -d "$LATEST_BACKUP" ]; then
  rm -rf "$DEPLOY_DIR"
  cp -r "$LATEST_BACKUP" "$DEPLOY_DIR"
  echo "Rollback successful!"
else
  echo "No backup found. Rollback failed."
fi
