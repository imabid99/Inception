FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y php-fpm php-mysql curl  && apt-get install mariadb-server -y

COPY ./tools/script.sh /

CMD ["bash","script.sh"]