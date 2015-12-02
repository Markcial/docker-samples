#!/bin/sh
docker run --name demo-nginx -d -p 80:80 -v $(pwd)/../fpm-nginx-mysql/src:/usr/share/nginx/application demo-fpm-nginx-mysql
