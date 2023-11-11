#!/bin/bash

until mysqladmin ping -h $MYSQL_DB_HOST -u"$MYSQL_USER" -p"$MYSQL_DB_PASSWORD" --silent; do
    echo 'waiting for mariadb ...'
    sleep 1
done

wp --allow-root core download --path=/var/www/wordpress


cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s/database_name_here/$MYSQL_DB_NAME/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_DB_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$MYSQL_DB_HOST/g" /var/www/wordpress/wp-config.php

echo "HMMMMMM"

wp --allow-root core install --path=/var/www/wordpress \
    --url="aharrass.42.fr" \
    --title="LTB" \
    --admin_user=$WORDPRESS_ADMIN_USER \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL

wp --allow-root user create tester tester@example.com --user_pass="1234" --path=/var/www/wordpress

wp --allow-root config set WP_REDIS_PORT "6379" --path=/var/www/wordpress
wp --allow-root config set WP_REDIS_HOST "redis_c" --path=/var/www/wordpress

chown -R www-data:www-data /var/www/wordpress

wp --allow-root plugin install redis-cache --force --activate --path=/var/www/wordpress

wp --allow-root redis enable --path=/var/www/wordpress

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F