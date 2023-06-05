FROM debian:buster

RUN apt-get update && apt-get install php-fpm php-mysql && apt-get install curl -y && apt-get install maradb-server -y

COPY ./tools/script.sh /

CMD ["script.sh"]