FROM debian:buster

RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y wget nginx default-mysql-server php php-mbstring php-fpm php-mysql openssl nano

COPY srcs/start.sh				srcs/
COPY srcs/index.htm				srcs/
COPY srcs/init_mysql.sql		srcs/
COPY srcs/wordpress.tar.gz		var/www/html/
COPY srcs/phpmyadmin.tar		var/www/html/
COPY srcs/defaulton				etc/nginx/sites-available/default

EXPOSE 80 443

ENTRYPOINT bash srcs/start.sh