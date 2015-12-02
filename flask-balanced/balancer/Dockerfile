FROM gliderlabs/alpine:3.1

RUN apk-install nginx

ADD confs/balancer.conf /etc/nginx/nginx.conf

RUN mkdir /tmp/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
