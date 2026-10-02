#!/bin/bash

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mariadbd --user=mysql & pid="$!"
until mariadb-admin ping --silent; do
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USERNAME'@'%';"

mariadb-admin shutdown

exec "$@"
