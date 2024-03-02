# mkdir -p ./lib/plugin/auth_pam_tool_dir
# touch /auth_pam_tool_dir/auth_pam_tool

cat > /tmp/create_db_sql << EOF
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db_sql
/usr/bin/mysqld -u mysql
