service mysql start

sed -i "s|127.0.0.1|0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

echo "CREATE DATABASE newdatabase;" > file_name
echo "CREATE USER 'user'@'%' IDENTIFIED BY 'imadabid1999';" >> file_name
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';" >> file_name
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1999';" >> file_name
echo "FLUSH PRIVILEGES;"

mysql < file_name
sleep 100
mysqld