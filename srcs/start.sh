#!/bin/bash

echo "Unzip PHP & Wordpress"
cd var/www/html/
tar -xf phpmyadmin.tar
tar -xzf wordpress.tar.gz
rm -rf wordpress.tar.gz phpmyadmin.tar
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/html

echo "Set autoindex"
rm /var/www/html/index.*
cd /etc/nginx/sites-available
autoindex=`cat default | grep autoindex`
if [ "$autoindex" != "		autoindex on;" ]
then
	cp /srcs/index.htm /var/www/html/
fi

echo "Start PHP"
service php7.3-fpm start

echo "Start MySQL"
service mysql start
mysql -u root -p123 < /srcs/init_mysql.sql

echo "Genarating new SSL keys"
cd etc/nginx
openssl req -x509 -out localhost.crt -keyout localhost.key \
	-newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost'

echo "Start Nginx"
service nginx start
# service mysql-u-p123 start

cd /
bash