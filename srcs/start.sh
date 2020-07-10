#!/bin/bash

echo "Unzip PHP & Wordpress"
cd var/www/html/
tar -xf phpmyadmin.tar
tar -xzf wordpress.tar.gz
rm -rf wordpress.tar.gz phpmyadmin.tar

echo "Set autoindex"
rm /var/www/html/index.*
cd /etc/nginx/sites-available
autoindex=`cat default | grep autoindex`
if [ "$autoindex" != "		autoindex on;" ]
then
	cp /srcs/index.htm /var/www/html/
fi

echo "Start MySQL"
service mysql start
mysql -u root -p123 < /srcs/init_mysql.sql

echo "Start PHP"
service php7.3-fpm start

echo "Start Nginx"
service nginx start
# service mysql-u-p123 start

cd /
bash