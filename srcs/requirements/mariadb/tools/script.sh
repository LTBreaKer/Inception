#!/bin/bash

echo "STARTING..."

service mariadb start

echo "MARIADB SERVICE STARTED"

mariadb -sfu root -p"$MYSQL_ROOT_PASSWORD" <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOS

echo "TEST"

mariadb -sfu root -p"$MYSQL_ROOT_PASSWORD" <<EOS
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
EOS

echo "DATABASE created successfully"
mariadb -sfu"root" -p"$MYSQL_ROOT_PASSWORD" <<EOS
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';
EOS

echo "USER created seccefully"
mariadb -sfu"root" -p"$MYSQL_ROOT_PASSWORD" <<EOS
GRANT ALL ON $MYSQL_DB_NAME.* to '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOS

echo "restarting mysql"
# service mariadb stop
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
mysqld

echo "FAILED"