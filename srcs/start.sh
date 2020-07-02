cd var/www/html/
tar -xf phpmyadmin.tar
tar -xzf wordpress.tar.gz
rm -rf wordpress.tar.gz phpmyadmin.tar
# rm index.nginx-debian.html

service nginx start
service php7.3-fpm start
service mysql start
# service mysql-u-p123 start
bash