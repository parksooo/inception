if [ ! -f "/var/www/html/index.php" ]; then
#워드 프레스 설치 여부 체크 후 다운
    wp core download
    wp config create --dbhost=maridb:3306 --dbname=${MYSQL_DB_NAME} --dbuser=${MYSQL_USER} \
                    --dbpass=${MYSQL_PWD}
    # 워드 프레스 설정 파일인 wp-config.php 설정 및 디비 정보 설정
    wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME} \
                    --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email
    # wp 설치, 어드민 계정 정보 설정
    wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PWD}
    # wp에 새로운 유저 생성
    fi

php-fpm81 -F
# php-fpm 서버 실행, forground shell session no demon