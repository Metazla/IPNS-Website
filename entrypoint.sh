#!/bin/bash

set -e

openresty -g 'daemon off;' &

cd /app/dist

# Start Nginx and Node.js app using PM2
pm2 start "tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log -f" --name nginx
pm2 start /app/dist/index.js --name node-app

# Keep the container running
pm2 log
