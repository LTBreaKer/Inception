#!/bin/bash
service mariadb start

mariadb -sfu root -p"$MYSQL_ROOT_PASSWORD" <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOS

mariadb -sfu root -p"$MYSQL_ROOT_PASSWORD" <<EOS
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
EOS

mariadb -sfu"root" -p"$MYSQL_ROOT_PASSWORD" <<EOS
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';
EOS

mariadb -sfu"root" -p"$MYSQL_ROOT_PASSWORD" <<EOS
GRANT ALL ON $MYSQL_DB_NAME.* to '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOS

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
mysqld
