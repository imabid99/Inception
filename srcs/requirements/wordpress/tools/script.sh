#! /bin/sh

if [ -d "/var/www/html/wop/wp-admin" ]; then
  rm -rf /var/www/html/wop/*
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/html/wop
cd /var/www/html/wop

wp core download --path=/var/www/html/wop --allow-root
wp config create --dbhost=mariadb --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD  --path=/var/www/html/wop --skip-check --allow-root
wp core install  --url=$WP_URL --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path=/var/www/html/wop --skip-email --allow-root
wp user create $MY_USER $MY_EMAIL --role=author --user_pass=$MY_PASSWORD --path=/var/www/html/wop --allow-root
wp theme install oceanwp --activate --path=/var/www/html/wop --allow-root

wp plugin install redis-cache --activate --path=/var/www/html/wop --allow-root
wp config set WP_REDIS_HOST 'redis' --path=/var/www/html/wop --allow-root
wp config set WP_REDIS_PORT '6379' --path=/var/www/html/wop --allow-root
wp redis enable --path=/var/www/html/wop --allow-root
chown -R www-data:www-data /var/www/html/wop
chmod -R 755 /var/www/html/wop


sed -i 's/\/run\/php\/php7.3-fpm.sock/ 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F

