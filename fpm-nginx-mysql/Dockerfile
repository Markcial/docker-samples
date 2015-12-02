FROM debian:jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.7-1~jessie
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'mariadb-server-5.5 mysql-server/root_password password admin' | debconf-set-selections
RUN echo 'mariadb-server-5.5 mysql-server/root_password_again password admin' | debconf-set-selections

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} \
    mariadb-server php5-fpm php5-mysql \
    php-apc php5-curl php5-gd php5-intl supervisor

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key D880C8E4 \
	  && echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ ./' > /etc/apt/sources.list.d/fish-shell.list \
	  && apt-get update && apt-get install -y fish --no-install-recommends \
	  && mkdir -p /root/.config/fish/completions

RUN apt-get -y install curl git && rm -rf /var/lib/apt/lists/*

# Composer install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir /usr/share/nginx/application
ADD src /usr/share/nginx/application
RUN cd /usr/share/nginx/application; composer install

# create default database
RUN /bin/bash -c "/usr/bin/mysqld_safe &" && \
  sleep 5 && \
  mysql -uroot -padmin -e "CREATE DATABASE mywonderfulapp" && \
  php /usr/share/nginx/application/artisan migrate --force

COPY confs/site.conf /etc/nginx/nginx.conf
COPY confs/supervisord.conf /etc/supervisord.conf

VOLUME ["/var/cache/nginx", "/var/lib/mysql", "/usr/share/nginx/application"]

EXPOSE 80 443

CMD ["supervisord"]
