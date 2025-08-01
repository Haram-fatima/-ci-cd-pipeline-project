#!/bin/bash

echo "Rolling back backend..."

# This is a basic example — update based on your logic
ROLLBACK_DIR="/var/www/backend_backup"
DEPLOY_DIR="/var/www/backend"

if [ -d "$ROLLBACK_DIR" ]; then
  rm -rf $DEPLOY_DIR
  mv $ROLLBACK_DIR $DEPLOY_DIR
  echo "Rollback successful!"
else
  echo "No backup found. Rollback failed."
fi
