#!/bin/bash

echo "Starting backend deployment..."

# Variables
BACKEND_ARCHIVE="backend.tar.gz"
DEPLOY_DIR="/var/www/backend"

# Extract archive
mkdir -p $DEPLOY_DIR
tar -xzf $BACKEND_ARCHIVE -C $DEPLOY_DIR

echo "Backend deployed successfully!"

