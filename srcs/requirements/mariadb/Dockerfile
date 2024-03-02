FROM alpine:3.18.6

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client tini

COPY ./conf/deploy.sh /tmp/deploy.sh

RUN chown -R mysql:mysql /run/mysqld

RUN sed -i "s/skip-networking/skip-networking=0/g" /etc/my.cnf.d/mariadb-server.cnf
# MariaDB 서버 설정 파일 수정, 네트워크 연결 가능
RUN sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf
# bind-address 옵션 수정, 모든 IP 주소로부터의 연결 수락

RUN mysql_install_db --user=mysql \
                    --basedir=/usr \
                    --datadir=/var/lib/mysql \
                    --skip-test-db

RUN chmod +x /tmp/deploy.sh
EXPOSE 3306
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "/tmp/deploy.sh"]