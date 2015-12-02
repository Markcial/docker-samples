#!/bin/sh
SOURCE=$(realpath $(dirname $0))
ROOT=$(dirname $SOURCE)

docker build -t demo-nginx ${ROOT}/fpm-nginx-mysql
docker run --name demo-nginx -d -p 80:80 -v ${ROOT}/fpm-nginx-mysql/src:/usr/share/nginx/application demo-nginx
