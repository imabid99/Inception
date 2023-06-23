FROM debian:buster

RUN apt-get update && apt-get install -y php-fpm php-mysql curl

COPY ./tools/script.sh /

CMD ["bash","script.sh"]
