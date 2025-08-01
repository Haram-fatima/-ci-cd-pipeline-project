#!/bin/bash

echo "Deploying frontend..."

ARCHIVE="frontend.tar.gz"
DEPLOY_DIR="/home/jenkins/frontend"

rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"
tar -xzf "$ARCHIVE" -C "$DEPLOY_DIR"

echo "Frontend deployed successfully!"

