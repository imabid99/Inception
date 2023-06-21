#! /bin/sh

if [ -d "/var/www/html/wop/wp-admin" ]; then
  rm -rf /var/www/html/wop/*
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/html/wop
wp core download --path=/var/www/html/wop --allow-root

cp /wp-config.php /var/www/html/wop/wp-config.php
sed -i -r "s/mydb/$DB_NAME/1"  /var/www/html/wop/wp-config.php
sed -i -r "s/myuser/$DB_USER/1" /var/www/html/wop/wp-config.php
sed -i -r "s/mypwd/$DB_PASSWORD/1"  /var/www/html/wop/wp-config.php

wp core install  --url=$WP_URL --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path=/var/www/html/wop --skip-email --allow-root

wp user create $MY_USER $MY_EMAIL --role=author --user_pass=$MY_PASSWORD --path=/var/www/html/wop --allow-root

wp theme install oceanwp --activate --path=/var/www/html/wop --allow-root

wp plugin install redis-cache --activate --path=/var/www/html/wop --allow-root

wp config set WP_REDIS_HOST 'redis' --path=/var/www/html/wop --allow-root
wp config set WP_REDIS_PORT '6379' --path=/var/www/html/wop --allow-root
wp config set WP_REDIS_DATABASE '0' --path=/var/www/html/wop --allow-root
# wp config set WP_CACHE_KEY_SALT "$KEY_SALT" --path=/var/www/html/wop --allow-root




chown -R www-data:www-data /var/www/html/wop
chmod -R 755 /var/www/html/wop

sed -i 's/\/run\/php\/php7.3-fpm.sock/ 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
wp redis enable --path=/var/www/html/wop --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F

