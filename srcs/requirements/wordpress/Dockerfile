FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli curl\
    && apt-get install -y mariadb-server

COPY ./tools/script.sh /

CMD ["bash","script.sh"]
