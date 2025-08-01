#!/bin/bash

echo "Starting backend deployment..."

# Paths
ARCHIVE="backend.tar.gz"
DEPLOY_DIR="/home/jenkins/backend"
BACKUP_DIR="/home/jenkins/backups/backup_$(date +%F_%T)"

# Backup old if exists
if [ -d "$DEPLOY_DIR" ]; then
  mkdir -p "$(dirname "$BACKUP_DIR")"
  cp -r "$DEPLOY_DIR" "$BACKUP_DIR"
fi

# Clean and deploy
rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"
tar -xzf "$ARCHIVE" -C "$DEPLOY_DIR"

cd "$DEPLOY_DIR/dist" || exit 1
npm install --production || true

# Restart backend
pm2 stop all || true
pm2 start main.js --name backend

echo "Backend deployed successfully!"
