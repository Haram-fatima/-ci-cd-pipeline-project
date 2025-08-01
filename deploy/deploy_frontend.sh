#!/bin/bash
set -e
<<<<<<< HEAD
ssh jenkins@10.108.66.161 << 'ENDSSH'
sudo mv /var/www/html /var/www/html_backup_$(date +%F_%T) || true
sudo mkdir -p /var/www/html
ENDSSH

scp frontend.tar.gz jenkins@10.108.66.161 :/tmp/
ssh jenkins@10.108.66.161 << 'ENDSSH'
sudo tar -xzf /tmp/frontend.tar.gz -C /var/www/html --strip-components=1
sudo nginx -s reload
=======

ssh jenkins@10.108.66.161 << 'ENDSSH'
rm -rf ~/frontend-deploy
mkdir ~/frontend-deploy
ENDSSH

scp frontend.tar.gz jenkins@10.108.66.161:~/frontend-deploy/

ssh jenkins@10.108.66.161 << 'ENDSSH'
cd ~/frontend-deploy
tar -xzf frontend.tar.gz
pm2 stop frontend || true
pm2 serve build 3000 --name frontend
>>>>>>> 8c33995 (Updated Jenkinsfile and deploy scripts, added backend archive and monitoring setup)
ENDSSH

