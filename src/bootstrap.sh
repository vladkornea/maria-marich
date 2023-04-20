php -v

mysql -V
service mariadb start

apache2 -v
apachectl start

sleep 1
service apache2 status
service mariadb status

mysql -u root -e "CREATE DATABASE $LIVE_DB_NAME;"
mysql -u root -e "GRANT ALL PRIVILEGES ON $LIVE_DB_NAME.* TO '$LIVE_DB_USER'@'localhost' IDENTIFIED BY '$LIVE_DB_PASSWORD';"
mysql -u root -e "CREATE DATABASE $TEST_DB_NAME;"
mysql -u root -e "GRANT ALL PRIVILEGES ON $TEST_DB_NAME.* TO '$TEST_DB_USER'@'localhost' IDENTIFIED BY '$TEST_DB_PASSWORD';"
mysql -u root -e "CREATE DATABASE $DEV_DB_NAME;"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DEV_DB_NAME.* TO '$DEV_DB_USER'@'localhost' IDENTIFIED BY '$DEV_DB_PASSWORD';"

tail -f /dev/null
