cat > /tmp/deploy_sql << EOF
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS '$MYSQL_DB_NAME';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';
ALTER USER 'root@localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
FLUSH PRIVILEGES;
/usr/bin/mysql --user=mysql --bootstrap < /tmp/deploy_sql
/usr/bin/mysql -u mysql;