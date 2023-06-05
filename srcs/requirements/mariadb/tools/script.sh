#!/bin/sh

service mysql start

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

echo "CREATE DATABASE $DB_NAME ;" > file_name
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> file_name
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> file_name
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1999';" >> file_name

mysql < file_name

sleep 1
kill $(pidof mysqld)

mysqld