#!/bin/bash
set -e
ssh jenkins@10.171.221.161 << 'ENDSSH'
# Rollback backend
latest_backup=$(ls -td ~/app-backups/* | head -1)
rm -rf ~/app-backend
cp -r "$latest_backup" ~/app-backend
pm2 restart all

# Rollback frontend
latest_html=$(ls -td /var/www/html_backup_* | head -1)
sudo rm -rf /var/www/html
sudo cp -r "$latest_html" /var/www/html
sudo nginx -s reload
ENDSSH

