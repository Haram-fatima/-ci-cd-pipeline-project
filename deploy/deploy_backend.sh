#!/bin/bash

echo "Starting backend deployment..."

# Paths
ARCHIVE="backend.tar.gz"
DEPLOY_DIR="/var/lib/jenkins/deployment/backend"
BACKUP_BASE="/var/lib/jenkins/backups"
BACKUP_DIR="$BACKUP_BASE/backup_$(date +%F_%T)"

# Backup old deployment if it exists
if [ -d "$DEPLOY_DIR" ]; then
  mkdir -p "$BACKUP_BASE"
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
