mysql -V
/etc/init.d/mariadb start

apache2 -v
/etc/init.d/apache2 start

php -v

service apache2 status
service mariadb status

#tail -f /our/logs/maria-marich/apache2_access_log #logrotate might cause problems here
tail -f /dev/null
