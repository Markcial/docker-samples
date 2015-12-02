#!/bin/sh
docker run -h site-01 --name flask-01 -d -p 5001:5001 flask-site gunicorn -w 4 -b 0.0.0.0:5001 main:app
docker run -h site-02 --name flask-02 -d -p 5002:5002 flask-site gunicorn -w 4 -b 0.0.0.0:5002 main:app
docker run -h site-03 --name flask-03 -d -p 5003:5003 flask-site gunicorn -w 4 -b 0.0.0.0:5003 main:app
docker run --link flask-01:flask-site-01 \
           --link flask-02:flask-site-02 \
           --link flask-03:flask-site-03 \
           -p 7000:80 -d --name nginx-balancer balancer
