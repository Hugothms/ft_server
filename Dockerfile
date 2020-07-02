FROM debian:buster

RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y wget nginx default-mysql-server php php-mbstring php-fpm php-mysql openssl nano

COPY srcs ./srcs/

EXPOSE 80 443

ENTRYPOINT bash srcs/start.sh