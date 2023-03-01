FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server
    # apt-get clean && \
    # rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD my.cnf /etc/mysql/conf.d/

CMD ["mysqld", "--user=mysql", "--console"]