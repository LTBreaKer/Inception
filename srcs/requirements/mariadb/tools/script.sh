#!/bin/bash

service mariadb start

mysql -sfu root <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOS

mysql -sfu root -p"$MYSQL_ROOT_PASSWORD" <<EOS
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* to '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOS


# service mariadb stop
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
mysqld