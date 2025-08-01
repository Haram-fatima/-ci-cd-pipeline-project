#!/bin/bash
set -e
ssh jenkins@10.171.221.161 << 'ENDSSH'
sudo mv /var/www/html /var/www/html_backup_$(date +%F_%T) || true
sudo mkdir -p /var/www/html
ENDSSH

scp frontend.tar.gz jenkins@10.171.221.161:/tmp/
ssh jenkins@10.171.221.161 << 'ENDSSH'
sudo tar -xzf /tmp/frontend.tar.gz -C /var/www/html --strip-components=1
sudo nginx -s reload
ENDSSH

