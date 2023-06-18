#!/bin/sh

service mysql start
sleep 1

echo "CREATE DATABASE $DB_NAME ;" > file_name
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> file_name
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> file_name
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1999';" >> file_name

mysql < file_name
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(pidof mysqld)
sleep 1

mysqld_safe

# #!/bin/sh

# service mysql start
# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# # sleep 1

# echo "CREATE DATABASE $DB_NAME ;" > file_name
# echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> file_name
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> file_name
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1999';" >> file_name

# mysql < file_name
# # sleep 1
# # sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# kill $(pidof mysqld)

# mysqld
# !/bin/sh

# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# service mysql start

# if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
#     mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
#     mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;"
#     mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
#     mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PWD' ;"
# fi
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld