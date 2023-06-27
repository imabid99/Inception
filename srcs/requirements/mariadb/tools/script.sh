#!/bin/sh

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" >> file_name
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> file_name
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> file_name
echo "FLUSH PRIVILEGES;" >> file_name
mysql < file_name
mysqladmin shutdown

mysqld_safe
